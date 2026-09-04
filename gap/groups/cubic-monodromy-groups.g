###### Type I  - 3^3:S4

# Monpar for Type I Cubics (trivial)
SGV_RegisterGroup( rec(
  id := "mpc1",
  field := Rationals,
  comment := "Parameter-monodromy for Type I cubics",
  gens:= [
        [[ 1, 0, 0, 0, 0, 0 ],
         [ 0, 1, 0, 0, 0, 0 ],
         [ 0, 0, 1, 0, 0, 0 ],
         [ 0, 0, 0, 1, 0, 0 ],
         [ 0, 0, 0, 0, 1, 0 ],
         [ 0, 0, 0, 0, 0, 1 ]]
        ],
  claims := rec(Size := 1),
));

# Monstack for Type I cubics, same as group
SGV_RegisterGroup( rec(
    id:= "msc1",
    field := Rationals,
    comment := "Stacky monodromy for Type I cubics",
    gens := SGV_GroupData("cType1").gens,
    claims := rec(IdGroup := [648, 704]),
));

###### Type II - S5

# Monpar for Type II Cubics (trivial)
SGV_RegisterGroup( rec(
  id := "mpc2",
  field := Rationals,
  comment := "Parameter-monodromy for Type II cubics",
  gens:= SGV_GroupData( "mpc1" ).gens,
  claims := rec(Size := 1),
));

# Monstack for Type II Cubics (equal to group)
SGV_RegisterGroup( rec(
    id := "mmc2",
    field := Rationals,
    comment := "Stacky monodromy for Type II cubics",
    gens := SGV_GroupData( "cType2").gens,
    claims := rec(IdGroup := [120,34]),
));

###### Type III - H_3(3):4

# Monpar for Type III Cubics (center of group)
SGV_RegisterGroup( rec(
  id := "mpc3",
  field := Rationals,
  comment := "Parameter-monodromy for Type III cubics",
  gens:= [ 
        [ [ -1, 0, 0, 1, -1, 0 ], [ -1, 0, 1, 0, -1, 0 ], [ -1, 0, 0, 1, -1, -1 ], [ -2, 1, 1, 0, -1, -1 ], [ -1, 1, 1, 0, -1, -1 ], [ -1, 0, 1, 0, 0, -1 ] ] ],
  claims := rec(Size := 3),
));

# Monstack for type III cubics (equal to group)
SGV_RegisterGroup( rec(
    id := "msc3",
    field := Rationals,
    comment := "Stacky monodromy for Type III cubics",
    gens := SGV_GroupData("cType3").gens,
));

###### Type IV - H_3(3):2

# Monstack for Type IV cubics (unique index two subgroup in N_W(G))
SGV_RegisterGroup( rec(
    id := "msc4",
    field := Rationals,
    comment := "Stacky monodromy for Type IV cubics",
    gens :=[ [ [ 0, -1, 0, 0, 1, 0 ], [ 1, -1, 0, 0, 1, -1 ], [ 1, -1, 0, 0, 1, 0 ], [ 1, -1, 1, -1, 2, -1 ], [ 1, -1, 1, -1, 1, 0 ], [ 1, 0, 0, -1, 1, 0 ] ], 
  [ [ 1, 0, -1, 0, 0, 1 ], [ 1, 0, -1, 1, -1, 1 ], [ 1, 1, -1, 0, -1, 2 ], [ 2, 1, -1, 0, -1, 2 ], [ 2, 1, -1, 0, -1, 1 ], [ 1, 1, -1, 0, 0, 0 ] ], 
  [ [ 0, -1, 0, 1, 0, -1 ], [ 0, 0, 0, 0, 1, -2 ], [ 1, -1, -1, 1, 1, -2 ], [ 0, -1, -1, 1, 2, -3 ], [ 0, -1, 0, 0, 2, -2 ], [ 0, -1, 0, 0, 1, -1 ] ] ],
));
# Monpar for Type IV cubics (unique index two subgroup in C_W(G))
SGV_RegisterGroup( rec(
    id := "mpc4",
    field := Rationals,
    comment := "Parameter monodromy for Type IV cubics",
    gens := [ [ [ 0, 0, 0, -1, 1, 0 ], [ 1, -1, -1, 0, 1, 0 ], [ 1, 0, -1, -1, 1, 1 ], [ 2, -1, -1, -1, 1, 1 ], [ 1, -1, -1, 0, 0, 1 ], [ 1, 0, -1, 0, 0, 0 ] ] ],
));

###### Type V - S4

# Monpar for Type V Cubics (automorphism group S4)
SGV_RegisterGroup( rec(
    id := "mpc5",
    field := Rationals,
    comment := "Parameter-level monodromy for Type V cubics",
    gens := [ [ [ 1, 0, 0, 0, 0, 0 ], [ 1, 1, 0, -1, 0, 1 ], [ 1, 0, 1, -1, 0, 1 ], [ 2, 0, 0, -1, 0, 2 ], [ 1, 0, 0, -1, 1, 1 ], [ 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 1, -1, 0, 0, 0 ], [ 0, 1, -1, 0, 1, -1 ], [ -1, 1, -1, 0, 1, -1 ], [ -1, 2, -1, 0, 1, -2 ], [ -1, 2, 0, -1, 1, -1 ], [ 0, 1, 0, -1, 1, -1 ] ] ],
  claims := rec(IdGroup := [4,2]),
));

###### Type VI - D6

###### Type VII - C8

###### Type VIII - S3

###### Type IX - C4

###### Type X - C2.C2

###### Type XI - C2