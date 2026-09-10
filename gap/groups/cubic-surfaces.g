#############################################################################
##
##  cubic-surfaces.g -- subgroups of PGL_4 acting on symmetric cubic surfaces.
##
##  Group definitions only.  No assertions live here; see gap/checks/.
##  File names are by topic, never by section number.
##

## The Weyl group of E6
SGV_RegisterGroup( rec(
  id := "WE6",
  field := Rationals,
  comment := "The Weyl group of E6",
  gens:= [
    [
      [ -1, 0, 1, 0, 0, 0 ],
      [ 0, 1, 0, 0, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0 ],
      [ 0, 0, 0, 1, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0 ],
      [ 0, 0, 0, 0, 0, 1 ] ],
    [
      [ 1, 0, 0, 0, 0, 0 ],
      [ 0, -1, 0, 1, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0 ],
      [ 0, 0, 0, 1, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0 ],
      [ 0, 0, 0, 0, 0, 1 ]
    ],
    [
      [ 1, 0, 0, 0, 0, 0 ],
      [ 0, 1, 0, 0, 0, 0 ],
      [ 1, 0, -1, 1, 0, 0 ],
      [ 0, 0, 0, 1, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0 ],
      [ 0, 0, 0, 0, 0, 1 ]
    ],
    [
      [ 1, 0, 0, 0, 0, 0 ],
      [ 0, 1, 0, 0, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0 ],
      [ 0, 1, 1, -1, 1, 0 ],
      [ 0, 0, 0, 0, 1, 0 ],
      [ 0, 0, 0, 0, 0, 1 ]
      ],
    [
      [ 1, 0, 0, 0, 0, 0 ],
      [ 0, 1, 0, 0, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0 ],
      [ 0, 0, 0, 1, 0, 0 ], 
      [ 0, 0, 0, 1, -1, 1 ], 
      [ 0, 0, 0, 0, 0, 1 ] 
    ],
    [
      [ 1, 0, 0, 0, 0, 0 ],
      [ 0, 1, 0, 0, 0, 0 ],
      [ 0, 0, 1, 0, 0, 0 ],
      [ 0, 0, 0, 1, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0 ],
      [ 0, 0, 0, 0, 1, -1 ]
    ]
  ],
  claims := rec(Size := 51840),
));

## grptype I: (C3 x C3 x C3):S4, Carter class A_2, IdGroup [648,704]
SGV_RegisterGroup( rec(
  id := "cType1",
  ambient := "WE6",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 1 (grptype I): (C3 x C3 x C3):S4, Carter class A_2",
  gens:= [
    [
      [-1,  0,  0,  0,  0,  1],
      [-1,  1,  0, -1,  1,  0],
      [-2,  0,  0,  0,  1,  0],
      [-2,  1, -1,  0,  1,  0],
      [-1,  0, -1,  0,  1,  0],
      [-1,  0,  0,  0,  0,  0]
    ],
    [
      [ 1,  0, -1,  0,  0,  1],
      [ 1,  0, -1,  1, -1,  1],
      [ 2,  0, -1,  0,  0,  1],
      [ 2, -1, -1,  1, -1,  2],
      [ 1,  0,  0,  0, -1,  2],
      [ 1,  0,  0,  0, -1,  1]
    ],
    [
      [ 0,  1,  0,  0, -1,  1],
      [-1,  0,  0,  1, -1,  1],
      [ 0,  0,  0,  1, -2,  2],
      [-1,  0,  0,  2, -3,  2],
      [ 0,  0, -1,  2, -2,  1],
      [ 0,  0, -1,  1, -1,  1]
    ]
  ],
  claims := rec(Size := 648),
));

## grptype II: S5, Carter class A_4, IdGroup [120,34]
SGV_RegisterGroup( rec(
  id := "cType2",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 2 (grptype II): S5, Carter class A_4",
  gens:= [
    [
      [ 0, -1,  0,  1, -1,  1],
      [-1, -1,  1,  0,  0,  1],
      [ 0, -1,  1,  0, -1,  2],
      [-1, -2,  2,  0, -1,  2],
      [-1, -1,  1,  0, -1,  2],
      [-1,  0,  1,  0, -1,  1]
    ],
    [
      [ 0,  1, -1,  0,  0,  0],
      [-1,  0, -1,  1,  0,  0],
      [ 0,  0, -2,  1,  0,  0],
      [-1,  0, -2,  2, -1,  0],
      [ 0,  0, -2,  2, -1,  0],
      [ 0,  0, -1,  1,  0, -1]
    ]
  ],
  claims := rec(Size := 120),
));

## grptype III: ((C3 x C3):C3):C4, Carter class E_6, IdGroup [108,15]
SGV_RegisterGroup( rec(
  id := "cType3",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 3 (grptype III): ((C3 x C3):C3):C4, Carter class E_6",
  gens:= [
    [
      [ 1,  0,  0,  0,  0,  0],
      [ 1,  1,  0,  0, -1,  0],
      [ 1,  1,  0,  0, -1,  1],
      [ 1,  2,  0,  0, -1,  0],
      [ 1,  2,  0, -1,  0,  0],
      [ 1,  1, -1,  0,  0,  0]
    ],
    [
      [ 0,  1,  0,  0,  0, -1],
      [-1,  1,  1,  0, -1,  0],
      [ 0,  1,  1,  0, -1, -1],
      [ 0,  2,  1,  0, -2,  0],
      [ 0,  1,  1,  0, -1,  0],
      [ 0,  1,  1, -1,  0,  0]
    ]
  ],
  claims := rec(Size := 108),
));

## grptype IV: ((C3 x C3):C3):C2, Carter class 3A_2, IdGroup [54,8]
SGV_RegisterGroup( rec(
  id := "cType4",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 4 (grptype IV): ((C3 x C3):C3):C2, Carter class 3A_2",
  gens:= [
    [
      [ 0,  0,  0, -1,  1,  0],
      [ 1, -1, -1,  0,  1,  0],
      [ 1,  0, -1, -1,  1,  1],
      [ 2, -1, -1, -1,  1,  1],
      [ 1, -1, -1,  0,  0,  1],
      [ 1,  0, -1,  0,  0,  0]
    ],
    [
      [-1,  1,  1, -1,  0,  0],
      [-1,  0,  1,  0, -1,  0],
      [-2,  0,  2, -1,  0,  0],
      [-2,  0,  3, -1, -1,  0],
      [-2,  0,  2,  0, -1,  0],
      [-1,  0,  1,  0, -1,  1]
    ],
    [
      [-1,  0,  0,  0,  1, -1],
      [-1,  1,  0, -1,  1,  0],
      [-2,  1,  1, -1,  1, -1],
      [-2,  2,  0, -1,  1, -1],
      [-2,  1,  0,  0,  0,  0],
      [-1,  1,  0,  0,  0,  0]
    ],
    [
      [ 1,  0,  0,  0,  0,  0],
      [ 1, -1,  0,  1, -1,  0],
      [ 2,  0, -1,  1, -1,  0],
      [ 2,  0,  0,  1, -2,  0],
      [ 2,  0,  0,  0, -1,  0],
      [ 1,  0,  0,  0,  0, -1]
    ]
  ],
  claims := rec(Size := 54),
));

## grptype V: S4, Carter class A_1+A_3, IdGroup [24,12]
SGV_RegisterGroup( rec(
  id := "cType5",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 5 (grptype V): S4, Carter class A_1+A_3",
  gens:= [
    [
      [ 0, -1,  0,  0,  1,  0],
      [-1, -1,  1,  0,  1, -1],
      [ 0, -2,  0,  1,  1, -1],
      [-1, -2,  1,  1,  1, -1],
      [-1, -2,  1,  1,  0,  0],
      [ 0, -1,  1,  0,  0,  0]
    ],
    [
      [ 0, -1,  0,  1, -1,  1],
      [ 0, -1,  1,  0, -1,  1],
      [ 0, -1,  1,  0, -1,  2],
      [ 0, -1,  1,  0, -2,  3],
      [-1, -1,  1,  0, -1,  2],
      [-1,  0,  1,  0, -1,  1]
    ]
  ],
  claims := rec(Size := 24),
));

## grptype VI: S3 x C2, Carter class A_1A_5, IdGroup [12,4]
SGV_RegisterGroup( rec(
  id := "cType6",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 6 (grptype VI): S3 x C2, Carter class A_1A_5",
  gens:= [
    [
      [ 0,  1,  0, -1,  1,  0],
      [ 0,  1,  0,  0,  0,  0],
      [-1,  1,  1, -1,  1,  0],
      [-1,  2,  1, -1,  0,  1],
      [ 0,  1,  1, -1,  0,  1],
      [ 0,  0,  0,  0,  0,  1]
    ],
    [
      [ 0, -1,  0,  1,  0, -1],
      [ 1, -1,  0,  0,  1, -1],
      [ 1, -1, -1,  1,  1, -2],
      [ 2, -2, -1,  1,  1, -2],
      [ 2, -1, -1,  1,  0, -1],
      [ 1,  0,  0,  0,  0, -1]
    ]
  ],
  claims := rec(Size := 12),
));

## grptype VII: C8, Carter class D_5, IdGroup [8,1]
SGV_RegisterGroup( rec(
  id := "cType7",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 7 (grptype VII): C8, Carter class D_5",
  gens:= [
    [
      [ 0,  1,  0,  0, -1,  1],
      [ 0,  1, -1,  1, -1,  0],
      [ 1,  1, -1,  1, -2,  1],
      [ 1,  2, -2,  1, -2,  1],
      [ 0,  1, -1,  1, -2,  1],
      [ 0,  0, -1,  1, -1,  1]
    ]
  ],
  claims := rec(Size := 8),
));

## grptype VIII: S3, Carter class 2A_2, IdGroup [6,1]
SGV_RegisterGroup( rec(
  id := "cType8",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 8 (grptype VIII): S3, Carter class 2A_2",
  gens:= [
    [
      [ 0, -1, -1,  1,  0,  0],
      [ 0, -1, -1,  2, -1,  0],
      [ 0, -2, -1,  2, -1,  1],
      [-1, -2, -1,  3, -2,  1],
      [-1, -2,  0,  2, -1,  0],
      [-1, -1,  0,  1,  0,  0]
    ],
    [
      [ 0, -1, -1,  1,  0,  0],
      [ 0, -1,  0,  0,  0,  0],
      [ 0, -1, -1,  1,  0, -1],
      [ 1, -2, -1,  1,  0, -1],
      [ 1, -1, -1,  1, -1,  0],
      [ 1,  0, -1,  0,  0,  0]
    ]
  ],
  claims := rec(Size := 6),
));

## grptype IX: C4, Carter class D_4(a_1), IdGroup [4,1]
SGV_RegisterGroup( rec(
  id := "cType9",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 9 (grptype IX): C4, Carter class D_4(a_1)",
  gens:= [
    [
      [ 1,  0,  0,  0,  0,  0],
      [ 1,  0, -1,  1,  0, -1],
      [ 1,  1,  0,  0,  0, -1],
      [ 1,  0,  0,  1,  0, -2],
      [ 0,  0,  0,  1,  0, -1],
      [ 0,  0,  0,  1, -1,  0]
    ]
  ],
  claims := rec(Size := 4),
));

## grptype X: C2 x C2, Carter class 2A_1, IdGroup [4,2]
SGV_RegisterGroup( rec(
  id := "cType10",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 10 (grptype X): C2 x C2, Carter class 2A_1",
  gens:= [
    [
      [-1,  0,  0,  0,  1, -1],
      [-1,  1,  1, -1,  1, -1],
      [-2,  0,  1,  0,  1, -1],
      [-2,  0,  2, -1,  2, -2],
      [-1,  0,  1, -1,  2, -1],
      [-1,  0,  1, -1,  1,  0]
    ],
    [
      [ 1,  0,  0,  0,  0,  0],
      [ 1, -1,  0,  0,  1, -1],
      [ 2,  0, -1,  0,  1, -1],
      [ 2,  0,  0, -1,  2, -2],
      [ 1,  0,  0,  0,  1, -2],
      [ 1,  0,  0,  0,  0, -1]
    ]
  ],
  claims := rec(Size := 4),
));

## grptype XI: C2, Carter class 4A_1, IdGroup [2,1]
SGV_RegisterGroup( rec(
  id := "cType11",
  field := Rationals,
  comment := "Representative WE6 subgroup for cubic-surface symmetry type 11 (grptype XI): C2, Carter class 4A_1",
  gens:= [
    [
      [ 1,  0,  0,  0,  0,  0],
      [ 1, -1,  0,  0,  1, -1],
      [ 2,  0, -1,  0,  1, -1],
      [ 2,  0,  0, -1,  2, -2],
      [ 1,  0,  0,  0,  1, -2],
      [ 1,  0,  0,  0,  0, -1]
    ]
  ],
  claims := rec(Size := 2),
));

