###### Type I  - PSL_2(7)

# Monstack for Type I quartics
SGV_RegisterGroup( rec(
  id := "msq1",
  field := Rationals,
  comment := "Stacky monodromy for Type I quartics - equals the group itself PSL_2(7)",
  gens:= SGV_GroupData("qType1").gens,
));

# Monpar for Type I quartics
SGV_RegisterGroup( rec(
  id := "mpq1",
  field := Rationals,
  comment := "Parameter-monodromy for Type I quartics (trivial)",
  gens:= [
        [[ 1, 0, 0, 0, 0, 0, 0 ],
         [ 0, 1, 0, 0, 0, 0, 0 ],
         [ 0, 0, 1, 0, 0, 0, 0 ],
         [ 0, 0, 0, 1, 0, 0, 0 ],
         [ 0, 0, 0, 0, 1, 0, 0 ],
         [ 0, 0, 0, 0, 0, 1, 0 ],
         [ 0, 0, 0, 0, 0, 0, 1 ]]
        ],
  claims := rec(Size := 1),
));

###### Type II  - 4^2:S3

# Monstack for Type II quartics
SGV_RegisterGroup( rec(
  id := "msq2",
  field := Rationals,
  comment := "Stacky monodromy for Type II quartics - equals the group itself 4^2:S3",
  gens:= SGV_GroupData("qType2").gens,
  claims := rec(Size := 1),
));

# Monpar for Type II quartics
SGV_RegisterGroup( rec(
  id := "mpq2",
  field := Rationals,
  comment := "Parameter monodromy for Type II quartics - trivial",
  gens:= SGV_GroupData("mpq1").gens,
));

###### Type III  - C4\circledcirc A4

# Monstack for Type III quartics
SGV_RegisterGroup( rec(
    id:= "msq3",
    field := Rationals,
    comment := "Stacky monodromy for Type III quartics - equal to the group itself C4 circledcirc A4",
    gens := SGV_GroupData("qType3").gens,
));

# Monpar for Type III quartics
SGV_RegisterGroup( rec(
    id := "mpq3",
    field := Rationals,
    comment := "Parameter monodromy for Type III quartics - equal to the center of the group C4 circledcirc A4",
    gens :=[ [ [ 1, 1, 0, 0, -1, 0, 0 ], [ 1, 2, 0, -1, 0, -1, 1 ], [ 1, 2, 0, 0, -1, -1, 1 ], [ 2, 3, -1, 0, -1, -2, 2 ], [ 2, 2, -1, 0, 0, -2, 1 ], [ 2, 1, -1, 0, 0, -1, 1 ], [ 1, 0, 0, 0, 0, -1, 1 ] ], 
  [ [ 0, 1, 1, -1, -1, 1, 0 ], [ 0, 1, 2, -2, 0, 0, 0 ], [ 0, 2, 2, -2, -1, 0, 1 ], [ 0, 2, 3, -3, -1, 0, 1 ], [ 0, 2, 2, -2, -1, 0, 0 ], [ 1, 1, 1, -1, -1, 0, 0 ], [ 0, 0, 1, 0, -1, 0, 0 ] ] ],
    claims := rec( IdGroup := [4,1]),
));

###### Type IV  - S4
# Monstack for Type IV quartics
SGV_RegisterGroup( rec(
    id:= "msq4",
    field := Rationals,
    comment := "Stacky monodromy for Type IV quartics - equal to the normalizer N_W(S4)",
    gens := SGV_GroupData("nType4").gens,
    claims := rec(IdGroup := [ 96, 226 ]),
));
# Monpar for Type IV quartics
SGV_RegisterGroup( rec(
    id:= "mpq4",
    field := Rationals,
    comment := "Parameter monodromy for Type IV quartics - equal to the centralizer C_W(S4)",
    gens := [ [ [ 1, -1, -1, 1, -1, 1, 0 ], [ 0, -2, 0, 1, -1, 1, 0 ], [ 0, -2, -1, 2, -2, 2, 0 ], [ 0, -4, -1, 3, -2, 2, 0 ], 
      [ 0, -3, -1, 3, -2, 1, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ -1, 1, 0, -1, 1, 0, 0 ], [ 0, 1, 0, -2, 2, 0, 0 ], [ 0, 2, -1, -2, 2, 0, 0 ], [ 0, 3, 0, -4, 3, 0, 0 ], 
      [ 0, 3, 0, -3, 2, 0, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ -1, 0, 1, 0, 0, -1, 0 ], [ 0, 0, 0, 1, -1, -1, 0 ], [ 0, 0, 1, 0, 0, -2, 0 ], [ 0, 1, 1, 0, -1, -2, 0 ], 
      [ 0, 0, 1, 0, -1, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 1 ] ] ],
    claims := rec(IdGroup := [4,2]),
));


###### Type V  - P
# Monstack for Type V quartics
SGV_RegisterGroup( rec(
    id := "msq5",
    field := Rationals,
    comment := "Stacky monodromy for Type V quartics - equals the unique index two subgroup of N_W(P) containing U_2(3)",
    gens := [ [ [ 0, 0, 1, -1, 1, -1, 1 ], [ 1, 1, 0, -1, 1, -1, 1 ], [ 0, 1, 1, -1, 1, -2, 2 ], [ 1, 1, 0, -1, 2, -3, 3 ], [ 0, 1, 0, -1, 2, -2, 2 ], [ 0, 1, 0, -1, 1, -1, 2 ], [ 0, 1, 0, -1, 1, -1, 1 ] ], 
  [ [ 1, -1, 0, 0, 0, 0, 1 ], [ 1, -1, -1, 1, -1, 1, 1 ], [ 1, -1, 0, 0, -1, 1, 2 ], [ 2, -1, -1, 1, -2, 1, 3 ], [ 1, -1, 0, 1, -2, 1, 2 ], [ 0, -1, 0, 1, -1, 0, 2 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 0, 0, -1, 2, -1, 0 ], [ 0, 1, 0, -2, 2, 0, 0 ], [ 0, 1, 1, -3, 3, -1, 0 ], [ 1, 2, 0, -4, 4, -1, 0 ], [ 1, 2, 0, -3, 3, -1, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ -1, -1, 0, 1, -1, 1, 0 ], [ -1, -1, 1, 1, -2, 1, 0 ], [ -2, -2, 1, 2, -2, 1, 0 ], [ -2, -3, 2, 2, -3, 2, 0 ], [ -1, -3, 1, 2, -2, 1, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ 1, 0, 0, 0, 0, -1, 0 ], [ 1, -1, -1, 1, 0, -1, 0 ], [ 2, 0, -1, 0, 0, -1, 0 ], [ 2, 0, -2, 1, 0, -2, 0 ], [ 1, 0, -1, 1, -1, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 1 ] ], 
  [ [ 0, 0, 0, 1, -2, 1, 0 ], [ 0, -1, 0, 2, -2, 0, 0 ], [ 0, -1, -1, 3, -3, 1, 0 ], [ -1, -2, 0, 4, -4, 1, 0 ], [ -1, -2, 0, 3, -3, 1, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ -1, 1, 1, -1, 1, -1, 0 ], [ 0, 1, 1, -2, 2, -1, 0 ], [ 0, 2, 1, -2, 2, -2, 0 ], [ 0, 2, 1, -3, 4, -3, 0 ], [ 0, 2, 0, -2, 3, -2, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ -1, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, -1, 1, 1, 0 ], [ 0, 0, -1, 0, 0, 2, 0 ], [ 0, 0, 0, -1, 0, 3, 0 ], [ 0, 1, 0, -1, 0, 2, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ] ],
    claims := rec( IdGroup := [ 384, 18139 ]),
));

# Monpar for Type V quartics
SGV_RegisterGroup( rec(
    id:= "mpq5",
    field := Rationals,
    comment := "Parameter monodromy for Type V quartics - equals the centralizer C_W(P)",
    gens := [ [ [ -1, 0, 0, 0, 0, 0, 0 ], [ 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 1 ] ], 
  [ [ -1, -1, 0, 1, -1, 1, 0 ], [ 0, -2, 0, 1, -1, 1, 0 ], [ 0, -2, -1, 2, -2, 2, 0 ], [ 0, -3, 0, 2, -3, 3, 0 ], [ 0, -2, 0, 2, -3, 2, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ -1, 1, 0, -1, 1, 0, 0 ], [ 0, 1, 0, -2, 2, 0, 0 ], [ 0, 2, -1, -2, 2, 0, 0 ], [ 0, 3, 0, -4, 3, 0, 0 ], [ 0, 3, 0, -3, 2, 0, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ 0, 0, 1, -1, 0, 1, 0 ], [ 1, 1, 0, -1, 0, 1, 0 ], [ 0, 1, 1, -1, -1, 2, 0 ], [ 1, 1, 1, -1, -1, 2, 0 ], [ 0, 1, 1, -1, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ -1, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, -1, 1, 1, 0 ], [ 0, 0, -1, 0, 0, 2, 0 ], [ 0, 0, 0, -1, 0, 3, 0 ], [ 0, 1, 0, -1, 0, 2, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ] ],
    claims := rec(IdGroup := [16,10]),
));

###### Type VI  - C9
# Monstack for Type VI quartics
SGV_RegisterGroup( rec(
    id:= "msq6",
    field := Rationals,
    comment := "Stacky monodromy for Type VI quartics - equals the group itself C9",
    gens := SGV_GroupData("qType6").gens,
));
# Monpar for Type VI quartics
SGV_RegisterGroup( rec(
    id:= "mpq6",
    field := Rationals,
    comment := "Parameter monodromy for Type VI quartics - equals the group itself C9",
    gens := SGV_GroupData("qType6").gens,
));

###### Type VII  - D8
# Monstack for Type VII quartics
SGV_RegisterGroup( rec(
    id:= "msq8",
    field := Rationals,
    comment := "Stacky monodromy for Type VII quartics - equals the normalizer N_W(D8)",
    gens := SGV_GroupData("nType7").gens,
    claims := rec(IdGroup := [ 256, 25876 ]),
));
# Monpar for Type VII quartics
SGV_RegisterGroup( rec(
    id:= "mpq8",
    field := Rationals,
    comment := "Parameter monodromy for Type VII quartics - equals the centralizer C_W(D8)",
    gens := [ [ [ -1, 0, 0, 0, 0, 0, 0 ], [ 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 1 ] ], 
  [ [ 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 1, -1, 1, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 2, -1, 0, 1, 0 ], [ 0, 1, 1, -1, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ -1, -1, 0, 1, -1, 1, 0 ], [ 0, -2, 0, 1, -1, 1, 0 ], [ 0, -2, -1, 2, -2, 2, 0 ], [ 0, -3, 0, 2, -3, 3, 0 ], [ 0, -2, 0, 2, -3, 2, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ -1, 1, 0, -1, 1, 0, 0 ], [ 0, 1, 0, -2, 2, 0, 0 ], [ 0, 2, -1, -2, 2, 0, 0 ], [ 0, 3, 0, -4, 3, 0, 0 ], [ 0, 3, 0, -3, 2, 0, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ 0, 0, -1, 1, 0, 0, 0 ], [ 1, 0, -1, 0, 1, 0, 0 ], [ 0, -1, -1, 1, 1, 0, 0 ], [ 1, -1, -1, 1, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 0, 1, -1, 0, 1, 0 ], [ -1, 1, 1, -1, 0, 1, 0 ], [ 0, 1, 1, -1, -1, 2, 0 ], [ -1, 1, 1, -1, -1, 3, 0 ], [ 0, 1, 0, -1, 0, 2, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 0, 1, -1, 0, 1, 0 ], [ 1, 1, 0, -1, 0, 1, 0 ], [ 0, 1, 1, -1, -1, 2, 0 ], [ 1, 1, 1, -1, -1, 2, 0 ], [ 0, 1, 1, -1, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ -1, 0, 0, 0, 0, 1, 0 ], [ 0, 1, -1, 0, 0, 1, 0 ], [ 0, 0, -1, 0, 0, 2, 0 ], [ 0, 0, -2, 1, 0, 2, 0 ], [ 0, 0, -1, 0, 1, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ] ],
    claims := rec(IdGroup := [32,46]),
));


###### Type VIII  - C6
# Monstack for Type VIII quartics
SGV_RegisterGroup( rec(
    id:= "msq8",
    field := Rationals,
    comment := "Stacky monodromy for Type VIII quartics - equals the unique index two subgroup in N_W(C6)",
    gens := [ [ [ 1, 0, 1, -1, 0, 0, 0 ], [ 1, 0, 1, -1, 1, -1, 0 ], [ 1, 0, 2, -1, 0, -1, 0 ], [ 2, -1, 2, -1, 1, -2, 0 ], [ 1, -1, 2, -1, 1, -1, -1 ], [ 1, -1, 1, 0, 0, 0, -1 ], [ 0, -1, 1, 0, 0, 0, 0 ] ], 
  [ [ -1, 1, 0, 0, 0, -1, 1 ], [ -1, 1, 0, 0, 0, -1, 0 ], [ -1, 1, -1, 1, 0, -2, 1 ], [ -1, 2, -1, 1, -1, -2, 1 ], [ -1, 2, -1, 1, -1, -1, 0 ], [ -1, 1, 0, 1, -1, -1, 0 ], [ -1, 0, 0, 1, -1, 0, 0 ] ], 
  [ [ 1, -1, -1, 0, 1, 0, 0 ], [ 1, 0, -1, -1, 1, 1, 0 ], [ 2, -1, -1, -1, 1, 1, 0 ], [ 2, -1, -1, -2, 2, 1, 1 ], [ 2, 0, -1, -2, 2, 0, 1 ], [ 1, 0, -1, -1, 1, 0, 1 ], [ 1, 0, -1, 0, 0, 0, 1 ] ] ],
    claims := rec(IdGroup := [72,25]),
));
# Monpar for Type VIII quartics
SGV_RegisterGroup( rec(
    id:= "mpq8",
    field := Rationals,
    comment := "Parameter monodromy for Type VIII quartics - equals the unique index two subgroup in N_W(C6)",
    gens := SGV_GroupData("msq8").gens,
));

###### Type IX  - S3
# Monstack for Type IX quartics
# Monpar for Type IX quartics

# TODO

###### Type X  - K4
# Monstack for Type X quartics
SGV_RegisterGroup( rec(
    id:= "msq10",
    field := Rationals,
    comment := "Stacky monodromy for Type X quartics - equals the normalizer N_W(K4)",
    gens := SGV_GroupData("nType10"),
    claims := rec(Size := 1536),
));
# Monpar for Type X quartics
SGV_RegisterGroup( rec(
    id:= "mpq10",
    field := Rationals,
    comment := "Parameter monodromy for Type X quartics - equals the centralizer C_W(K4)",
    gens := [ [ [ 1, 0, -1, 0, 0, 0, 0 ], [ 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, -1 ] ], 
  [ [ -1, 0, 0, 0, 0, 0, 0 ], [ 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 1 ] ], 
  [ [ -1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 1, -1, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, 1, -1, 0, -1, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, -1 ] ], 
  [ [ -1, 0, 0, 0, 0, 0, 0 ], [ 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0 ], [ 0, -1, -1, 0, 1, -1, 0 ], [ 0, -1, -1, 1, 0, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, -1 ] ], 
  [ [ 0, 1, 0, 0, 0, -1, 1 ], [ 1, 1, 0, -1, 1, -1, 1 ], [ 0, 1, 1, -1, 1, -2, 2 ], [ 1, 1, 0, -1, 2, -3, 3 ], [ 0, 1, 0, -1, 2, -2, 2 ], [ 0, 1, 0, -1, 1, -1, 2 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ -1, -1, 0, 1, -1, 1, 0 ], [ 0, -2, 0, 1, -1, 1, 0 ], [ 0, -2, -1, 2, -2, 2, 0 ], [ 0, -3, 0, 2, -3, 3, 0 ], [ 0, -2, 0, 2, -3, 2, 0 ], [ 0, -2, 0, 2, -2, 1, 0 ], [ 0, -1, 0, 1, -1, 1, -1 ] ], 
  [ [ -1, 1, 0, -1, 1, 0, 0 ], [ 0, 1, 0, -2, 2, 0, 0 ], [ 0, 2, -1, -2, 2, 0, 0 ], [ 0, 3, 0, -4, 3, 0, 0 ], [ 0, 3, 0, -3, 2, 0, 0 ], [ 0, 2, 0, -2, 2, -1, 0 ], [ 0, 1, 0, -1, 1, 0, -1 ] ], 
  [ [ 0, 0, -1, 1, 0, 0, 0 ], [ 1, 0, -1, 0, 1, 0, 0 ], [ 0, -1, -1, 1, 1, 0, 0 ], [ 1, -1, -1, 1, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 1, 0, -1, 0, 1, -1, 1 ], [ 0, 1, -1, 0, 1, -1, 1 ], [ 0, 0, -1, 0, 2, -2, 2 ], [ 0, 1, -1, 0, 2, -3, 3 ], [ 0, 1, 0, -1, 2, -2, 2 ], [ 0, 1, 0, -1, 1, -1, 2 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ -1, 0, 1, 0, 0, -1, 0 ], [ 0, -1, 1, 0, 0, -1, 0 ], [ 0, 0, 1, 0, 0, -2, 0 ], [ 0, 0, 2, -1, 0, -2, 0 ], [ 0, 0, 1, 0, -1, -1, 0 ], [ 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, -1 ] ] ],
    claims := rec(IdGroup := [ 256, 51978 ]),
));

###### Type XI  - C3
# Monstack for Type XI quartics
SGV_RegisterGroup( rec(
    id := "msq11",
    field := Rationals,
    comment := "Stacky monodromy for Type XI quartics - equals the unique index two subgroup in N_W(C3)",
    gens := [ [ [ 0, 1, -1, 1, -1, 0, 0 ], [ 1, 1, -2, 1, 0, -1, 0 ], [ 0, 1, -2, 2, -1, -1, 0 ], [ 1, 2, -3, 2, -1, -2, 1 ], [ 1, 1, -2, 2, -1, -2, 1 ], [ 0, 1, -1, 1, 0, -2, 1 ], [ 0, 1, 0, 0, 0, -1, 0 ] ], 
  [ [ 0, 1, -1, 0, 0, 0, 1 ], [ 0, 1, -1, 0, 1, -1, 1 ], [ -1, 1, -1, 0, 1, -1, 2 ], [ 0, 1, -2, 0, 2, -2, 3 ], [ 0, 0, -2, 1, 1, -1, 2 ], [ 0, 0, -1, 0, 1, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 1, 0, 0, -1, 1, 0 ], [ 0, 2, -1, 0, -1, 1, 0 ], [ -1, 2, 0, 0, -2, 2, 0 ], [ -1, 4, 0, -1, -2, 2, 0 ], [ 0, 3, 0, -1, -2, 2, 0 ], [ 0, 2, 0, 0, -2, 1, 0 ], [ 0, 1, 0, 0, -1, 1, -1 ] ] ],
    claims := rec(IdGroup := [ 648, 533 ]),
));
# Monpar for Type XI quartics
SGV_RegisterGroup( rec(
    id := "mpq11",
    field := Rationals,
    comment := "Stacky monodromy for Type XI quartics - equals the unique index two subgroup in N_W(C3)",
    gens := SGV_GroupData("msq11").gens,
));

###### Type XII  - C2
# Monstack for Type XII quartics
SGV_RegisterGroup( rec(
    id:= "msq10",
    field := Rationals,
    comment := "Stacky monodromy for Type XII quartics - equals the normalizer N_W(C2)",
    gens := SGV_GroupData("nType12").gens,
    claims := rec(Size := 4608),
));
# Monpar for Type XII quartics
SGV_RegisterGroup( rec(
    id:= "mpq10",
    field := Rationals,
    comment := "Parameter monodromy for Type XII quartics - equals the normalizer N_W(C2)",
    gens := SGV_GroupData("msq10").gens,
));