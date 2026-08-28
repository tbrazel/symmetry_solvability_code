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
