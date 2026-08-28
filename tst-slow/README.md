# Slow tests

Anything that takes more than a minute or two lives here, so that `tst/` stays
fast enough for CI to be run on every push and therefore actually trusted.

Run them by hand before a release:

    gap -q -c 'LoadPackage("SymmetricGalois"); TestDirectory("tst-slow", rec(exitGAP := true));'

If a computation here is expensive but its *answer* is small, cache the answer
in `data/` together with the script that regenerates it, and add a fast test in
`tst/` that checks the cached value.
