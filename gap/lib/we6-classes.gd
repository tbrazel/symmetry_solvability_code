#############################################################################
##
##  we6-classes.gd
##
##  Identify which of the 25 conjugacy classes of W(E6) a matrix belongs to,
##  using the table in data/we6-conjugacy-classes.g.  See that file for the
##  invariants used and where the data comes from.
##

#! The row of <C>SGV_WE6ConjugacyClassTable</C> (a record with components
#! <C>Atlas</C>, <C>Carter</C>, <C>Manin</C>, <C>Ord</C>, <C>C</C>, <C>Tr</C>,
#! <C>Tr3</C>) matching <A>g</A>, an element of <C>SGV_Group("WE6")</C>.
#!
#! The row is pinned down by successively filtering on order, trace,
#! centralizer size in <C>WE6</C>, and (only for the handful of classes those
#! three do not separate) the trace of <A>g</A>^3.
DeclareGlobalFunction( "SGV_WE6ClassRow" );

#! The ATLAS class name of <A>g</A> in <C>SGV_Group("WE6")</C>, e.g. <C>"6G"</C>.
DeclareGlobalFunction( "SGV_WE6AtlasLabel" );

#! The Carter admissible-diagram label of <A>g</A> in <C>SGV_Group("WE6")</C>,
#! e.g. <C>"A1+A2"</C>.
DeclareGlobalFunction( "SGV_WE6CarterLabel" );

#! The Manin label of <A>g</A> in <C>SGV_Group("WE6")</C>, e.g. <C>"c7"</C>.
DeclareGlobalFunction( "SGV_WE6ManinLabel" );

#! The ATLAS class names met by <A>H</A>, a subgroup of <C>SGV_Group("WE6")</C>
#! (or of any group whose elements lie in <C>WE6</C>), as a sorted list of
#! strings with no repeats.  Every conjugacy class of <A>H</A> lies inside a
#! single class of <C>WE6</C>, so this is computed from one representative per
#! class of <A>H</A> rather than every element.
DeclareGlobalFunction( "SGV_WE6ConjugacyClassesInSubgroup" );
