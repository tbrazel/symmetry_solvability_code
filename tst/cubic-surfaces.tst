#############################################################################
##
##  cubic-surfaces.tst
##
gap> START_TEST( "cubic-surfaces.tst" );

##  For each of the eleven cubic-surface symmetry groups cType1, ..., cType11,
##  the centralizer in W(E6) is solvable.
gap> WE6 := SGV_Group( "WE6" );;
gap> ForAll( [ 1 .. 11 ], i -> SGV_AssertCentralizerIsSolvable( WE6,
>      SGV_Group( Concatenation( "cType", String( i ) ) ) ) = true );
true

gap> STOP_TEST( "cubic-surfaces.tst" );
