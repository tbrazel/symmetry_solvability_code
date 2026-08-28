#############################################################################
##
##  groups.tst -- every registered group is the group we say it is.
##
##  This catches typos in matrix entries, which would otherwise silently
##  define a different group that the claims then "verify".
##
gap> START_TEST( "groups.tst" );

gap> SGV_CheckGroupData();
true

gap> STOP_TEST( "groups.tst" );
