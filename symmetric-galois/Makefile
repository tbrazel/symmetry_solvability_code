#############################################################################
##
##  Makefile -- glue between the paper and this repository.
##
##  paper/output.aux is a committed snapshot of the paper's \newlabel lines.
##  It is the only interface between the two repos: everything downstream
##  (the generated GAP reference table, the README table, the CI check)
##  is derived from it, so nothing here ever hard-codes a theorem number.
##

# Where your compiled .aux lives.  Override on the command line:
#   make sync-labels AUX=~/Downloads/paper.aux
AUX ?= ../paper/paper.aux

GAP ?= gap
PYTHON ?= python3
CROSSREF = $(PYTHON) tools/crossref.py
LABELS = paper/output.aux

.PHONY: all sync-labels refs readme check annotate test test-slow clean

all: refs check

## Refresh the label snapshot from a freshly compiled .aux.
## Run this after every recompile of the paper (Overleaf: Recompile ->
## "Other logs & files" -> download paper.aux).
sync-labels:
	@test -f "$(AUX)" || { echo "no .aux at $(AUX); set AUX=..."; exit 2; }
	grep '^\\newlabel' "$(AUX)" > $(LABELS)
	@echo "updated $(LABELS)"

## Regenerate the GAP-side lookup table read by read.g.
refs: $(LABELS)
	$(CROSSREF) gap $(LABELS) --format gap --out gap/paper-refs.g

## Regenerate the label table pasted into README.md.
readme: $(LABELS)
	$(CROSSREF) gap $(LABELS) --format md --out paper/label-table.md

## Fail if any label cited in the GAP sources no longer exists in the paper.
## This is the guard that makes renaming a \label safe.
check: $(LABELS)
	$(CROSSREF) gap $(LABELS) --check

## Write the current numbers into the GAP comments as [Lemma 12.3].
## Optional and idempotent -- re-running replaces stale annotations.
annotate: $(LABELS)
	$(CROSSREF) gap $(LABELS) --annotate

test:
	$(GAP) -q tst/testall.g

test-slow:
	$(GAP) -q -c 'LoadPackage("SymmetricGalois"); \
	  TestDirectory("tst-slow", rec(exitGAP := true));'

clean:
	rm -f gap/paper-refs.g paper/label-table.md
