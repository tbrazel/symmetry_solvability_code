#############################################################################
##
##  we6-classes.tst -- the ported ATLAS/Carter/Manin lookup table for W(E6)
##  and SGV_WE6ConjugacyClassesInSubgroup.  Print booleans and small data.
##
gap> START_TEST( "we6-classes.tst" );
gap> W := SGV_Group( "WE6" );;

##  The table has one row per conjugacy class of WE6, and every actual class
##  (taken via a representative) resolves to a distinct row.  This is the
##  regression test for the Ord/Tr/C/Tr3 tie-breaking in SGV_WE6ClassRow --
##  in particular that it separates the two pairs of classes ( 6C vs 6G, and
##  6E vs 6H ) that share order, trace and centralizer size.
gap> cc := ConjugacyClasses( W );;
gap> Length( cc );
25
gap> labels := List( cc, c -> SGV_WE6AtlasLabel( Representative( c ) ) );;
gap> Length( Set( labels ) );
25
gap> Set( labels ) = Set( List( SGV_WE6ConjugacyClassTable, r -> r.Atlas ) );
true

##  Carter and Manin labels for a couple of representatives, cross-checked
##  against the Carter class noted in the comment for each cType in
##  gap/groups/cubic-surfaces.g.
gap> g := First( cc, c -> SGV_WE6AtlasLabel( Representative( c ) ) = "4A" );;
gap> SGV_WE6CarterLabel( Representative( g ) );
"D4(a1)"
gap> g := First( cc, c -> SGV_WE6AtlasLabel( Representative( c ) ) = "6G" );;
gap> [ SGV_WE6CarterLabel( Representative( g ) ), SGV_WE6ManinLabel( Representative( g ) ) ];
[ "A1+A2", "c7" ]

##  SGV_WE6ConjugacyClassesInSubgroup on the registered cubic-surface types.
gap> SGV_WE6ConjugacyClassesInSubgroup( SGV_Group( "cType9" ) );  # C4, Carter D4(a1)
[ "1A", "2A", "4A" ]
gap> SGV_WE6ConjugacyClassesInSubgroup( SGV_Group( "cType11" ) );  # C2, Carter 4A1
[ "1A", "2A" ]
gap> SGV_WE6ConjugacyClassesInSubgroup( SGV_Group( "cType7" ) );  # C8, Carter D5
[ "1A", "2A", "4A", "8A" ]
gap> SGV_WE6ConjugacyClassesInSubgroup( SGV_Group( "cType1" ) );
[ "1A", "2A", "2B", "3A", "3C", "3D", "4B", "6A", "6C", "6E", "6F", "9A" ]

gap> STOP_TEST( "we6-classes.tst" );
