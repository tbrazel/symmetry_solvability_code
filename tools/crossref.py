#!/usr/bin/env python3
"""
crossref.py -- resolve LaTeX \\label keys cited in GAP comments to theorem numbers.

Write your GAP comments in terms of stable label keys:

    # Verifies \\Cref{lem:sym-cubic-irred}.
    InstallGlobalFunction( CheckSymCubicIrred, function() ... end );

then run this against the paper's .aux file to get the current numbers.

Modes:
  --format table   human-readable list (default)
  --format md      markdown table, e.g. for the repo README
  --format gap     a GAP record mapping label -> "Lemma 6.12"
  --annotate       rewrite the GAP files in place, appending [Lemma 6.12]
                   after each reference (idempotent -- re-run after edits)
  --check          exit 1 if any cited label is missing from the .aux

Exit codes: 0 ok, 1 unresolved labels (with --check), 2 bad usage.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

# ---------------------------------------------------------------- .aux parsing

# \newlabel{key}{{6.12}{23}{...}{lemma.6.12}{}}   (hyperref/plain)
NEWLABEL = re.compile(r"\\newlabel\{(?P<key>[^}]*)\}\{(?P<body>.*)$")

# cleveref writes a companion entry:
#   \newlabel{key@cref}{{[lemma][12][6]6.12}{[1][23][]23}}
CREF_TYPE = re.compile(r"\{?\[(?P<type>[^\]]*)\]")


def _first_group(body: str) -> str | None:
    """Return the contents of the first balanced {...} group in body."""
    depth = 0
    start = None
    for i, ch in enumerate(body):
        if ch == "{":
            depth += 1
            if depth == 1:
                start = i + 1
        elif ch == "}":
            depth -= 1
            if depth == 0 and start is not None:
                return body[start:i]
    return None


def parse_aux(paths: list[Path]) -> dict[str, dict]:
    """Map label key -> {'number': '6.12', 'type': 'lemma' or None}."""
    labels: dict[str, dict] = {}
    crefs: dict[str, str] = {}

    for path in paths:
        text = path.read_text(encoding="utf-8", errors="replace")
        for line in text.splitlines():
            m = NEWLABEL.match(line.strip())
            if not m:
                continue
            key, body = m.group("key"), m.group("body")
            inner = _first_group(body)
            if inner is None:
                continue
            if key.endswith("@cref"):
                t = CREF_TYPE.match(inner)
                if t:
                    crefs[key[: -len("@cref")]] = t.group("type")
            else:
                # The first group is the printed number. Under hyperref it can
                # itself be wrapped, so unwrap once more if needed.
                number = inner
                if number.startswith("{"):
                    number = _first_group(number) or number
                labels[key] = {"number": number.strip(), "type": None}

    for key, typ in crefs.items():
        if key in labels:
            labels[key]["type"] = typ
    return labels


def pretty(entry: dict) -> str:
    """'lemma' + '6.12' -> 'Lemma 6.12'."""
    number = entry["number"]
    typ = entry["type"]
    if not typ:
        return number
    # cleveref types are lowercase singular; capitalise, keep e.g. 'subsection'
    return f"{typ[:1].upper()}{typ[1:]} {number}"


# ---------------------------------------------------------------- GAP scanning

# \Cref{a,b}, \cref{...}, \ref{...}, \autoref{...}, \eqref{...}
REF = re.compile(r"\\(?:C|c)?ref\{([^}]*)\}|\\(?:autoref|eqref)\{([^}]*)\}")
# placeholders in doc comments, e.g. "the raw \Cref{...}" -- not real labels
PLACEHOLDER = re.compile(r"^[.\s]*$")
# an existing annotation directly after the reference, so re-runs replace it
ANNOTATED = re.compile(
    r"(\\(?:C|c)?ref\{[^}]*\}|\\(?:autoref|eqref)\{[^}]*\})(\s*\[[^\]\n]*\])?"
)


def comment_part(line: str) -> tuple[int, str]:
    """Return (index of '#', comment text). GAP comments run to end of line,
    but '#' inside a string literal or char literal is not a comment."""
    in_str = None
    i = 0
    while i < len(line):
        ch = line[i]
        if in_str:
            if ch == "\\":
                i += 2
                continue
            if ch == in_str:
                in_str = None
        elif ch in "\"'":
            in_str = ch
        elif ch == "#":
            return i, line[i:]
        i += 1
    return -1, ""


def scan_gap(paths: list[Path],
             claim_pattern: re.Pattern | None = None
             ) -> dict[str, list[tuple[Path, int]]]:
    """Map label key -> list of (file, line number) citing it.

    Labels are picked up from two places: \\Cref{...} and friends inside GAP
    comments, and (if claim_pattern is given) label strings passed to
    registration calls in code, e.g. SGV_RegisterClaim("lem:foo", ...).
    """
    cited: dict[str, list[tuple[Path, int]]] = {}
    for path in paths:
        text = path.read_text(encoding="utf-8", errors="replace")
        for lineno, line in enumerate(text.splitlines(), start=1):
            idx, comment = comment_part(line)
            if idx >= 0:
                for m in REF.finditer(comment):
                    keys = m.group(1) or m.group(2) or ""
                    for key in (k.strip() for k in keys.split(",")):
                        if key and not PLACEHOLDER.match(key):
                            cited.setdefault(key, []).append((path, lineno))
            if claim_pattern is not None:
                code = line if idx < 0 else line[:idx]
                for m in claim_pattern.finditer(code):
                    key = m.group(1).strip()
                    if key:
                        cited.setdefault(key, []).append((path, lineno))
    return cited


def annotate(paths: list[Path], labels: dict[str, dict]) -> int:
    """Rewrite each reference in a comment as \\Cref{key} [Lemma 6.12]."""
    changed = 0
    for path in paths:
        lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
        out = []
        touched = False
        for line in lines:
            idx, comment = comment_part(line)
            if idx < 0:
                out.append(line)
                continue

            def repl(m: re.Match) -> str:
                ref = m.group(1)
                inner = re.search(r"\{([^}]*)\}", ref).group(1)
                keys = [k.strip() for k in inner.split(",") if k.strip()]
                resolved = [pretty(labels[k]) for k in keys if k in labels]
                if len(resolved) != len(keys) or not resolved:
                    return ref  # unresolved: drop any stale annotation
                return f"{ref} [{', '.join(resolved)}]"

            new_comment = ANNOTATED.sub(repl, comment)
            if new_comment != comment:
                touched = True
                line = line[:idx] + new_comment
                if not line.endswith("\n"):
                    line += "\n"
            out.append(line)
        if touched:
            path.write_text("".join(out), encoding="utf-8")
            changed += 1
    return changed


# ---------------------------------------------------------------------- output

def collect(root: Path, suffixes: tuple[str, ...]) -> list[Path]:
    if root.is_file():
        return [root]
    return sorted(p for p in root.rglob("*") if p.suffix in suffixes)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("gap", type=Path, help="GAP file or directory to scan")
    ap.add_argument("aux", type=Path, help=".aux file, or directory of them")
    ap.add_argument("--format", choices=["table", "md", "gap"], default="table")
    ap.add_argument("--out", type=Path, default=None,
                    help="write output here instead of stdout")
    ap.add_argument("--name", default="SGV_PaperRefs",
                    help="global name for --format gap (default: SGV_PaperRefs)")
    ap.add_argument("--claim-pattern",
                    default=r'SGV_RegisterClaim\(\s*"([^"]+)"',
                    help="regex whose group 1 is a label key cited in GAP code; "
                         "pass an empty string to scan comments only")
    ap.add_argument("--annotate", action="store_true",
                    help="rewrite GAP files in place with resolved numbers")
    ap.add_argument("--check", action="store_true",
                    help="exit 1 if any cited label is unresolved")
    args = ap.parse_args(argv)

    gap_files = collect(args.gap, (".g", ".gi", ".gd", ".gap", ".tst"))
    aux_files = collect(args.aux, (".aux",))
    if not gap_files:
        print(f"no GAP files under {args.gap}", file=sys.stderr)
        return 2
    if not aux_files:
        print(f"no .aux files under {args.aux}", file=sys.stderr)
        return 2

    labels = parse_aux(aux_files)
    claim_re = re.compile(args.claim_pattern) if args.claim_pattern else None
    cited = scan_gap(gap_files, claim_re)
    missing = {k: v for k, v in cited.items() if k not in labels}

    lines: list[str] = []
    emit = lines.append

    if args.annotate:
        n = annotate(gap_files, labels)
        emit(f"annotated {n} file(s)")
    elif args.format == "md":
        emit("| Label | Reference | Verified in |")
        emit("| --- | --- | --- |")
        for key in sorted(cited):
            ref = pretty(labels[key]) if key in labels else "**UNRESOLVED**"
            seen: dict[str, int] = {}
            for p, n in cited[key]:
                seen.setdefault(p.name, n)
            where = ", ".join(f"`{f}:{n}`" for f, n in seen.items())
            emit(f"| `{key}` | {ref} | {where} |")
    elif args.format == "gap":
        # Record components are set by string, so label keys survive verbatim
        # (colons and hyphens are fine in GAP's r.("...") syntax).
        emit("# Generated by tools/crossref.py -- do not edit by hand.")
        emit(f'BindGlobal( "{args.name}", rec() );')
        for key in sorted(cited):
            if key in labels:
                emit(f'{args.name}.("{key}") := "{pretty(labels[key])}";')
    else:
        width = max(len(k) for k in cited) if cited else 0
        for key in sorted(cited):
            ref = pretty(labels[key]) if key in labels else "UNRESOLVED"
            emit(f"{key.ljust(width)}  ->  {ref}")
            for p, n in cited[key]:
                emit(f"{' ' * width}      {p}:{n}")

    text = "\n".join(lines) + "\n"
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(text, encoding="utf-8")
        print(f"wrote {args.out}")
    else:
        sys.stdout.write(text)

    if missing:
        print(f"\n{len(missing)} unresolved label(s): {', '.join(sorted(missing))}",
              file=sys.stderr)
        if args.check:
            return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
