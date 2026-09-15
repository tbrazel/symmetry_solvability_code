# SymmetricGalois — supplementary code for *Symmetry and solvability*

Supplementary code for the paper *Symmetry and solvability: Galois groups of
equivariant enumerative problems*, by [Thomas Brazelton](https://tbrazel.github.io/), [Alberto Landi](https://sites.google.com/brown.edu/alberto-landi/home)
and [Sidhanth Raman](https://www.svraman.com/). The code is a [GAP](https://www.gap-system.org/)
package that machine-checks the paper's group-theoretic claims.

**AI Disclosure**: AI was used to set up the architecture of this repo and the
`crossref.py` script which builds dynamic theorem numbers into the GAP comments
from theorem labels in the `.aux` file of the paper.

## Quick start

From the repository root, we can load the package, then run all the linked claims in the paper. This verifies many group-theoretic statements which are stated without proof in the paper.
```sh
gap> LoadPackage("SymmetricGalois");;
gap> SGV_RunAllClaims();
  PASS  Subsection 5.3    Type III cubic surface: the centre of cType3 is cyclic of order 3
  PASS  Lemma 6.16        Type IV cubic surface: cType4 has a unique conjugacy class of subgroups isomorphic to C6
  PASS  Proposition B.10  qType3 case: qType5 is the unique 2-Sylow subgroup of qType3
  PASS  Corollary 8.2     Cubic surfaces: the centralizer of each of cType1, ..., cType11 in W(E6) is solvable
  PASS  Section 8         Quartics: the centralizer of each of qType1, ..., qType12 in PSL62 is solvable
  ...
```

## Repository map

| Path | What lives there |
| --- | --- |
| `gap/registry.gd/.gi` | The two registries: groups and claims. |
| `gap/groups/*.g` | Group **data** — explicit generators, one file per topic. |
| `gap/checks/*.gi` | Claim **functions**, each registered against a `\label`. |
| `gap/paper-refs.g` | Generated label → "Lemma 12.3" table. Not hand-edited. |
| `tst/` | Fast tests; this is what CI runs. |
| `tst-slow/` | Everything too expensive for CI. |
| `data/` | Cached results of expensive computations. |
| `paper/output.aux` | Committed snapshot of the paper's `\newlabel` lines. |
| `tools/crossref.py` | Resolves labels to numbers; guards against stale ones. |
