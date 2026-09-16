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

InstallGlobalFunction( SGV_AssertCentralizerIsSolvable, function( G, H )
    local C;
    C := Centralizer( G, H );
    if IsSolvable( C ) then
        return true;
    fi;
    return rec( centralizerOrder     := Size( C ),
                centralizerStructure := StructureDescription( C ) );
end );

InstallGlobalFunction( SGV_AssertIsSplitExtension, function( G, N )
    local classes;
    classes := ComplementClassesRepresentatives( G, N );
    if not IsEmpty( classes ) then
        return true;
    fi;
    return rec( normalSubgroupOrder := Size( N ),
                quotientOrder       := Size( G ) / Size( N ),
                complementClasses   := 0 );
end );

InstallGlobalFunction( SGV_AssertIsNonsplitExtension, function( G, N )
    local classes;
    classes := ComplementClassesRepresentatives( G, N );
    if IsEmpty( classes ) then
        return true;
    fi;
    return rec( normalSubgroupOrder := Size( N ),
                quotientOrder       := Size( G ) / Size( N ),
                complementClasses   := Length( classes ),
                complementIds       := SortedList( List( classes, IdGroup ) ) );
end );

#############################################################################
##  Claims
##
##  The label passed to SGV_RegisterClaim is what tools/crossref.py picks up,
##  so the registration call is the single source of truth.  Repeat it in the
##  comment with \Cref{} if you like -- the tool reads both.





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




##  Verifies \Cref{cor:solvability}.
##  For each of the eleven cubic-surface symmetry groups cType1, ..., cType11,
##  the centralizer in W(E6) is solvable.
SGV_RegisterClaim( "cor:solvability",
    "Cubic surfaces: the centralizer of each of cType1, ..., cType11 in W(E6) is solvable",
    function( )
        local WE6, i, name, result, failures;
        WE6      := SGV_Group( "WE6" );
        failures := [];
        for i in [ 1 .. 11 ] do
            name   := Concatenation( "cType", String( i ) );
            result := SGV_AssertCentralizerIsSolvable( WE6, SGV_Group( name ) );
            if result <> true then
                result.cType := name;
                Add( failures, result );
            fi;
        od;
        if IsEmpty( failures ) then
            return true;
        fi;
        return failures;
    end );




##  Verifies \Cref{sec:radicals}.
##  For each of the twelve legacy quartic-symmetry groups qType1, ..., qType12,
##  the centralizer in PSL62 is solvable.
SGV_RegisterClaim( "sec:radicals",
    "Quartics: the centralizer of each of qType1, ..., qType12 in PSL62 is solvable",
    function( )
        local PSL62, i, name, result, failures;
        PSL62    := SGV_Group( "PSL62" );
        failures := [];
        for i in [ 1 .. 12 ] do
            name   := Concatenation( "qType", String( i ) );
            result := SGV_AssertCentralizerIsSolvable( PSL62, SGV_Group( name ) );
            if result <> true then
                result.qType := name;
                Add( failures, result );
            fi;
        od;
        if IsEmpty( failures ) then
            return true;
        fi;
        return failures;
    end );
