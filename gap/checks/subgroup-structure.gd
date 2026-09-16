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

#! Claim helper: <A>G</A> has exactly one conjugacy class of subgroups with
#! IdGroup <A>id</A> -- i.e. a subgroup isomorphic to that group exists and is
#! unique up to conjugacy in <A>G</A>, though there may be many such subgroups.
#! A strictly weaker statement than SGV_AssertUniqueSubgroupWithId; keep the two
#! apart.  Returns true, or a record describing what was found instead.
DeclareGlobalFunction( "SGV_AssertUniqueSubgroupClassWithId" );

#! Claim helper: <A>N</A> is the normalizer of <A>H</A> in <A>G</A>, i.e.
#! N_<A>G</A>(<A>H</A>) = <A>N</A> as subgroups of <A>G</A>.  Returns true, or a
#! record describing how the computed normalizer differs from <A>N</A>.
DeclareGlobalFunction( "SGV_AssertIsNormalizer" );

#! Claim helper: the centre of <A>G</A> is cyclic of order <A>n</A>.  Both
#! halves matter -- "order n" alone would not rule out a non-cyclic centre for
#! composite n -- so the record returned on failure reports each separately.
DeclareGlobalFunction( "SGV_AssertCenterIsCyclicOfOrder" );

#! Claim helper: the centralizer of <A>H</A> in <A>G</A> is solvable, i.e.
#! C_<A>G</A>(<A>H</A>) is a solvable group.  Returns true, or a record
#! reporting the centralizer's order and structure.
DeclareGlobalFunction( "SGV_AssertCentralizerIsSolvable" );

#! Claim helper: the extension <M>1 \to</M> <A>N</A> <M>\to</M> <A>G</A>
#! <M>\to</M> <A>G</A>/<A>N</A> <M>\to 1</M> splits, i.e. <A>N</A> has a
#! complement in <A>G</A> (a subgroup <M>H \le</M> <A>G</A> with
#! <M>H \cap</M> <A>N</A> <M>= 1</M> and <M>HN =</M> <A>G</A>).  <A>N</A>
#! must be normal in <A>G</A>.  Returns true, or a record describing the
#! (lack of) complement classes found.
DeclareGlobalFunction( "SGV_AssertIsSplitExtension" );

#! Claim helper: the extension <M>1 \to</M> <A>N</A> <M>\to</M> <A>G</A>
#! <M>\to</M> <A>G</A>/<A>N</A> <M>\to 1</M> does not split, i.e. <A>N</A>
#! has no complement in <A>G</A>.  The negation of
#! <C>SGV_AssertIsSplitExtension</C>, kept as its own claim helper so a
#! failure reads as "found a complement" rather than "did not find no
#! complement".  Returns true, or a record describing the complement
#! classes found.
DeclareGlobalFunction( "SGV_AssertIsNonsplitExtension" );
