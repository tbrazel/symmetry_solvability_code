#############################################################################
##
##  complex-reflection.gi
##

InstallMethod( SGV_ReflectionSet, "for a matrix group", [ IsMatrixGroup ],
    function( W )
        local gens, id;
        gens := GeneratorsOfGroup( W );
        if IsEmpty( gens ) then
            return Immutable( [ ] );
        fi;
        id := One( W );
        if not ForAll( gens, g -> RankMat( g - id ) = 1 ) then
            Error( "SGV_ReflectionSet: every generator of W must be a ",
                   "reflection (rank(g - 1) = 1)" );
        fi;
        # Every reflection is conjugate to a simple one, so the simple orbits
        # cover them all; OnPoints on matrices is conjugation.
        return Immutable( Set( Concatenation( List( gens,
                   s -> List( Orbit( W, s, OnPoints ), Immutable ) ) ) ) );
    end );

BindGlobal( "SGV_AsSubgroupOfW", function( W, G )
    if IsList( G ) then
        G := Subgroup( W, G );
    fi;
    if not ForAll( GeneratorsOfGroup( G ), g -> g in W ) then
        Error( "SGV_*ComplexReflectionSubgroup: G must be a subgroup of W" );
    fi;
    return G;
end );

InstallGlobalFunction( SGV_ReflectionSubgroupInfo, function( W, G )
    local refs, H;
    G    := SGV_AsSubgroupOfW( W, G );
    refs := Filtered( SGV_ReflectionSet( W ), r -> r in G );
    H    := Subgroup( W, refs );
    return rec(
        isComplexReflectionGroup  := Size( H ) = Size( G ),
        order                     := Size( G ),
        nrReflections             := Length( refs ),
        orderOfReflectionSubgroup := Size( H ),
        reflectionSubgroup        := H,
        structure                 := StructureDescription( H ) );
end );

InstallGlobalFunction( SGV_IsComplexReflectionSubgroup, function( W, G )
    local refs;
    G    := SGV_AsSubgroupOfW( W, G );
    refs := Filtered( SGV_ReflectionSet( W ), r -> r in G );
    return Size( Subgroup( W, refs ) ) = Size( G );
end );

InstallGlobalFunction( SGV_AssertIsComplexReflectionSubgroup, function( W, G )
    local info;
    info := SGV_ReflectionSubgroupInfo( W, G );
    if info.isComplexReflectionGroup then
        return true;
    fi;
    return info;
end );
