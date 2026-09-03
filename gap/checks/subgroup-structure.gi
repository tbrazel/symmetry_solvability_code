#############################################################################
##
##  subgroup-structure.gi
##

InstallGlobalFunction( SGV_CountSubgroupsWithId, function( G, id )
    return Number( AllSubgroups( G ), S -> IdGroup( S ) = id );
end );

InstallGlobalFunction( SGV_CountSubgroupClassesWithId, function( G, id )
    return Number( ConjugacyClassesSubgroups( G ),
                   c -> IdGroup( Representative( c ) ) = id );
end );

InstallGlobalFunction( SGV_AssertUniqueSubgroupWithId, function( G, id )
    local n;
    n := SGV_CountSubgroupsWithId( G, id );
    if n = 1 then
        return true;
    fi;
    return rec( expected := 1, found := n, targetId := id,
                subgroupIds := SortedList(
                    List( AllSubgroups( G ), IdGroup ) ) );
end );

InstallGlobalFunction( SGV_AssertUniqueSubgroupClassWithId, function( G, id )
    local n;
    n := SGV_CountSubgroupClassesWithId( G, id );
    if n = 1 then
        return true;
    fi;
    return rec( expected := 1, found := n, targetId := id,
                subgroupClassIds := SortedList(
                    List( ConjugacyClassesSubgroups( G ),
                          c -> IdGroup( Representative( c ) ) ) ) );
end );

InstallGlobalFunction( SGV_AssertIsNormalizer, function( G, H, N )
    local NGH;
    NGH := Normalizer( G, H );
    if NGH = N then
        return true;
    fi;
    return rec( expectedSize    := Size( N ),
                foundSize       := Size( NGH ),
                expectedInFound := IsSubgroup( NGH, N ),
                foundInExpected := IsSubgroup( N, NGH ) );
end );

InstallGlobalFunction( SGV_AssertCenterIsCyclicOfOrder, function( G, n )
    local Z;
    Z := Center( G );
    if Size( Z ) = n and IsCyclic( Z ) then
        return true;
    fi;
    return rec( expectedOrder  := n,
                expectedCyclic := true,
                foundOrder     := Size( Z ),
                foundCyclic    := IsCyclic( Z ),
                foundId        := IdGroup( Z ) );
end );

#############################################################################
##  Claims
##
##  The label passed to SGV_RegisterClaim is what tools/crossref.py picks up,
##  so the registration call is the single source of truth.  Repeat it in the
##  comment with \Cref{} if you like -- the tool reads both.


##  Verifies \Cref{prop:Vtype3}.
##  |qType3| = 48 = 2^4 * 3, and |qType5| = 16 is exactly the 2-part, so a
##  subgroup of qType3 matching qType5's IdGroup is automatically a Sylow
##  2-subgroup; SGV_AssertUniqueSubgroupWithId gives existence, uniqueness,
##  and isomorphism type in one shot.
SGV_RegisterClaim( "prop:Vtype3",
    "qType3 case: qType5 is the unique 2-Sylow subgroup of qType3",
    function( )
        return SGV_AssertUniqueSubgroupWithId( SGV_Group( "qType3" ),
                                               IdGroup( SGV_Group( "qType5" ) ) );
    end );


##  Verifies \Cref{subsec:type3-cubic-monodromy}.
##  The Type III cubic-surface symmetry group cType3 = ((C3 x C3):C3):C4 has
##  centre cyclic of order 3.
SGV_RegisterClaim( "subsec:type3-cubic-monodromy",
    "Type III cubic surface: the centre of cType3 is cyclic of order 3",
    function( )
        return SGV_AssertCenterIsCyclicOfOrder( SGV_Group( "cType3" ), 3 );
    end );


##  Verifies \Cref{lem: Type IV C6-pointed cubics}.
##  cType4 = ((C3 x C3):C3):C2 (IdGroup [54,8]) contains nine subgroups
##  isomorphic to C6 = [6,2], but they form a single conjugacy class: up to the
##  ambient symmetry there is exactly one C6 inside the Type IV group.
SGV_RegisterClaim( "lem: Type IV C6-pointed cubics",
    "Type IV cubic surface: cType4 has a unique conjugacy class of subgroups isomorphic to C6",
    function( )
        return SGV_AssertUniqueSubgroupClassWithId( SGV_Group( "cType4" ),
                                                    IdGroup( CyclicGroup( 6 ) ) );
    end );
