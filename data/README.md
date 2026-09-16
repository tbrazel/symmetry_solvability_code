# Cached computations

For results that are expensive to produce but small to store. Each cached file
should sit next to the script in `tst-slow/` that regenerates it, so a reader
can rerun the computation rather than take the cache on faith.

`we6-conjugacy-classes.g` is the one exception: it is external reference data
(ATLAS/Carter/Manin labels for W(E6)'s conjugacy classes), not a GAP
computation cached for speed, so there is no regenerating script for it. Its
own header explains where the labels come from and how the table was
cross-checked against `SGV_Group("WE6")`.
