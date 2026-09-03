# Monpar for Type III Cubics
SGV_RegisterGroup( rec(
  id := "mpc3",
  field := Rationals,
  comment := "Parameter-monodromy for Type III cubics",
  gens:= [ 
        [ [ -1, 0, 0, 1, -1, 0 ], [ -1, 0, 1, 0, -1, 0 ], [ -1, 0, 0, 1, -1, -1 ], [ -2, 1, 1, 0, -1, -1 ], [ -1, 1, 1, 0, -1, -1 ], [ -1, 0, 1, 0, 0, -1 ] ] ],
  claims := rec(Size := 3),
));

# Monpar for Type V Cubics (automorphism group S4)
SGV_RegisterGroup( rec(
    id := "mpc5",
    field := Rationals,
    comment := "Parameter-level monodromy for Type V cubics",
    gens := [ [ [ 1, 0, 0, 0, 0, 0 ], [ 1, 1, 0, -1, 0, 1 ], [ 1, 0, 1, -1, 0, 1 ], [ 2, 0, 0, -1, 0, 2 ], [ 1, 0, 0, -1, 1, 1 ], [ 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 1, -1, 0, 0, 0 ], [ 0, 1, -1, 0, 1, -1 ], [ -1, 1, -1, 0, 1, -1 ], [ -1, 2, -1, 0, 1, -2 ], [ -1, 2, 0, -1, 1, -1 ], [ 0, 1, 0, -1, 1, -1 ] ] ],
  claims := rec(IdGroup := [4,2]),
));