# Cached computations

For results that are expensive to produce but small to store. Each cached file
should sit next to the script in `tst-slow/` that regenerates it, so a reader
can rerun the computation rather than take the cache on faith.
