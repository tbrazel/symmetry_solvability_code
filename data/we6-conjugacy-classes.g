#############################################################################
##
##  we6-conjugacy-classes.g -- Atlas/Carter/Manin labels for the 25 conjugacy
##  classes of W(E6), keyed by invariants computable from a matrix in the
##  6-dimensional reflection representation registered as SGV_Group("WE6").
##
##  Source: ported from an external Sage classifier (Atlas, Carter, Manin
##  columns, plus Ord/C/Tr) that identified an element by its order, then its
##  trace, then its centralizer size in W(E6) -- in that order, stopping as
##  soon as the candidates narrow to one row.  W(E6) is ATLAS-isomorphic to
##  U4(2).2 (order 51840); Atlas is the ATLAS class name, Carter is Carter's
##  admissible-diagram label ("Conjugacy classes in the Weyl group", Compositio
##  Math. 25 (1972)), Manin is the numbering from Manin's "Cubic Forms".
##
##  Order+trace+centralizer size is NOT a complete invariant: classes 6C/6G
##  (Carter D4 / A1+A2) share (Ord,Tr,C) = (6,1,36), and 6E/6H (Carter A1+A5 /
##  A1+2A2) share (6,-2,36).  Tr3 -- the trace of the CUBE of the element --
##  breaks both ties; the values above were cross-checked two ways: (a)
##  numerically, against ConjugacyClasses( SGV_Group("WE6") ) in this package,
##  and (b) independently, from the eigenvalues of a Coxeter element of each
##  Carter diagram's root subsystem (e.g. D4 has exponents 1,3,3,5 at Coxeter
##  number 6, giving Tr = 1 and Tr3 = -2 once cubed), confirming which Atlas
##  letter goes with which Tr3 value.  See SGV_WE6ClassRow in
##  gap/lib/we6-classes.gi for how the table is consulted.
##

BindGlobal( "SGV_WE6ConjugacyClassTable", [
  rec( Atlas := "1A", Carter := "emptyset", Manin := "c1",
       Ord := 1, C := 51840, Tr := 6, Tr3 := 6 ),
  rec( Atlas := "2A", Carter := "4A1", Manin := "c3",
       Ord := 2, C := 1152, Tr := -2, Tr3 := -2 ),
  rec( Atlas := "2B", Carter := "2A1", Manin := "c2",
       Ord := 2, C := 192, Tr := 2, Tr3 := 2 ),
  rec( Atlas := "2C", Carter := "A1", Manin := "c16",
       Ord := 2, C := 1440, Tr := 4, Tr3 := 4 ),
  rec( Atlas := "2D", Carter := "3A1", Manin := "c17",
       Ord := 2, C := 96, Tr := 0, Tr3 := 0 ),
  rec( Atlas := "3A", Carter := "3A2", Manin := "c11",
       Ord := 3, C := 648, Tr := -3, Tr3 := 6 ),
  rec( Atlas := "3C", Carter := "A2", Manin := "c6",
       Ord := 3, C := 216, Tr := 3, Tr3 := 6 ),
  rec( Atlas := "3D", Carter := "2A2", Manin := "c9",
       Ord := 3, C := 108, Tr := 0, Tr3 := 6 ),
  rec( Atlas := "4A", Carter := "D4(a1)", Manin := "c4",
       Ord := 4, C := 96, Tr := 2, Tr3 := 2 ),
  rec( Atlas := "4B", Carter := "A1+A3", Manin := "c5",
       Ord := 4, C := 16, Tr := 0, Tr3 := 0 ),
  rec( Atlas := "4C", Carter := "2A1+A3", Manin := "c19",
       Ord := 4, C := 96, Tr := -2, Tr3 := -2 ),
  rec( Atlas := "4D", Carter := "A3", Manin := "c18",
       Ord := 4, C := 32, Tr := 2, Tr3 := 2 ),
  rec( Atlas := "5A", Carter := "A4", Manin := "c15",
       Ord := 5, C := 10, Tr := 1, Tr3 := 1 ),
  rec( Atlas := "6A", Carter := "E6(a2)", Manin := "c12",
       Ord := 6, C := 72, Tr := 1, Tr3 := -2 ),
  rec( Atlas := "6C", Carter := "D4", Manin := "c21",
       Ord := 6, C := 36, Tr := 1, Tr3 := -2 ),
  rec( Atlas := "6E", Carter := "A1+A5", Manin := "c10",
       Ord := 6, C := 36, Tr := -2, Tr3 := -2 ),
  rec( Atlas := "6F", Carter := "2A1+A2", Manin := "c8",
       Ord := 6, C := 24, Tr := -1, Tr3 := 2 ),
  rec( Atlas := "6G", Carter := "A1+A2", Manin := "c7",
       Ord := 6, C := 36, Tr := 1, Tr3 := 4 ),
  rec( Atlas := "6H", Carter := "A1+2A2", Manin := "c22",
       Ord := 6, C := 36, Tr := -2, Tr3 := 4 ),
  rec( Atlas := "6I", Carter := "A5", Manin := "c23",
       Ord := 6, C := 12, Tr := 0, Tr3 := 0 ),
  rec( Atlas := "8A", Carter := "D5", Manin := "c20",
       Ord := 8, C := 8, Tr := 0, Tr3 := 0 ),
  rec( Atlas := "9A", Carter := "E6(a1)", Manin := "c14",
       Ord := 9, C := 9, Tr := 0, Tr3 := -3 ),
  rec( Atlas := "10A", Carter := "A1+A4", Manin := "c25",
       Ord := 10, C := 10, Tr := -1, Tr3 := -1 ),
  rec( Atlas := "12A", Carter := "E6", Manin := "c13",
       Ord := 12, C := 12, Tr := -1, Tr3 := 2 ),
  rec( Atlas := "12C", Carter := "D5(a1)", Manin := "c24",
       Ord := 12, C := 12, Tr := 1, Tr3 := -2 )
] );
