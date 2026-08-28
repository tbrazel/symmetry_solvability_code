#############################################################################
##
##  subgroup-structure.gd
##
##  One declaration per claim.  Name each function for the claim it actually
##  checks: "unique subgroup isomorphic to H" and "unique up to conjugacy"
##  are different statements, and a function whose name overstates what it
##  computes is a lie waiting to be believed.
##

#! Number of subgroups of <A>G</A> with IdGroup equal to <A>id</A>.
DeclareGlobalFunction( "SGV_CountSubgroupsWithId" );

#! Number of conjugacy classes of subgroups of <A>G</A> with the given IdGroup.
DeclareGlobalFunction( "SGV_CountSubgroupClassesWithId" );

#! Claim helper: <A>G</A> has exactly one subgroup with IdGroup <A>id</A>.
#! Returns true, or a record describing what was found instead.
DeclareGlobalFunction( "SGV_AssertUniqueSubgroupWithId" );
