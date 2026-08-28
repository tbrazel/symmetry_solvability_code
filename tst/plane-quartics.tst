#############################################################################
##
##  plane-quartics.tst
##
##  Print booleans and small invariants only.  Never print a group, a list of
##  subgroups, or anything whose order comes out of a randomised algorithm:
##  Test() compares output literally, and those are not stable across GAP
##  versions.
##
gap> START_TEST( "plane-quartics.tst" );

##  For each legacy quartic-symmetry type i, the stored group nType<i> is
##  exactly the normalizer of qType<i> in PSL62.  Compute Size(PSL62) first:
##  it primes the group so Normalizer stays fast, and the value is stable.
gap> P := SGV_Group( "PSL62" );;
gap> Size( P );
1451520
gap> List( [ 1 .. 12 ],
>          i -> SGV_AssertIsNormalizer( P,
>                   SGV_Group( Concatenation( "qType", String( i ) ) ),
>                   SGV_Group( Concatenation( "nType", String( i ) ) ) ) );
[ true, true, true, true, true, true, true, true, true, true, true, true ]

gap> STOP_TEST( "plane-quartics.tst" );
