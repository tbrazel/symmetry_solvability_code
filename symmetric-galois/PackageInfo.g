#############################################################################
##
##  PackageInfo.g for the SymmetricGalois verification package.
##
##  Companion code for "Symmetry and Solvability: Galois Groups of
##  Equivariant Enumerative Problems".
##

SetPackageInfo( rec(

PackageName := "SymmetricGalois",
Subtitle    := "Computations verifying the assertions of the paper",
Version     := "0.1",
Date        := "26/08/2026",           # dd/mm/yyyy
License     := "GPL-2.0-or-later",

Persons := [
  rec( LastName := "Brazelton", FirstNames := "", IsAuthor := true,
       IsMaintainer := true, Email := "tbraz@alumni.upenn.edu" ),
  rec( LastName := "Landi", FirstNames := "", IsAuthor := true,
       IsMaintainer := false ),
  rec( LastName := "Raman", FirstNames := "", IsAuthor := true,
       IsMaintainer := false ),
],

Status         := "other",
PackageWWWHome := "https://github.com/tbrazel/symmetry_solvability_code",
README_URL     := Concatenation( ~.PackageWWWHome, "/blob/main/README.md" ),
PackageInfoURL := Concatenation( ~.PackageWWWHome, "/blob/main/PackageInfo.g" ),
ArchiveURL     := Concatenation( ~.PackageWWWHome, "/releases" ),
ArchiveFormats := ".tar.gz",

AbstractHTML := "Matrix groups and machine-checked assertions accompanying \
the paper <em>Symmetry and Solvability</em>.",

PackageDoc := rec(
  BookName  := "SymmetricGalois",
  ArchiveURLSubset := [ "doc" ],
  HTMLStart := "doc/chap0_mj.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := ~.Subtitle,
),

Dependencies := rec(
  GAP := ">= 4.11",
  NeededOtherPackages := [ ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,
TestFile := "tst/testall.g",
Keywords := [ "Galois group", "monodromy", "enumerative geometry" ],

) );
