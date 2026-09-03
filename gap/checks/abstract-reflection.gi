#############################################################################
##
##  abstract-reflection.gi
##
##  The decision procedure works with the multiset of directly-indecomposable
##  factors of the input group (Krull-Schmidt: two finite groups are isomorphic
##  iff these multisets agree).  The group is a complex reflection group iff its
##  factor multiset can be partitioned into blocks, each block being the factor
##  multiset of an irreducible complex reflection group.  Candidate irreducibles
##  are generated only for the finitely many orders that arise as a product of a
##  sub-multiset of the input's factor orders, which keeps the search small.
##

InstallGlobalFunction( SGV_ImprimitiveReflectionGroup, function( m, p, n )
    local z, gens, i, mat;

    if not ( IsPosInt( m ) and IsPosInt( n ) and IsPosInt( p ) and m mod p = 0 ) then
        Error( "SGV_ImprimitiveReflectionGroup: need positive m, n and p | m" );
    fi;

    z    := E( m );
    gens := [];

    for i in [ 1 .. n - 1 ] do                    # transpositions (i, i+1)
        mat := IdentityMat( n );
        mat[i][i]   := 0;  mat[i+1][i+1] := 0;
        mat[i][i+1] := 1;  mat[i+1][i]   := 1;
        Add( gens, mat );
    od;
    if n >= 2 then                                # diag(z, z^-1, 1, ..., 1)
        mat := IdentityMat( n ) * z^0;
        mat[1][1] := z;  mat[2][2] := z^-1;
        Add( gens, mat );
    fi;
    if p < m then                                 # diag(z^p, 1, ..., 1)
        mat := IdentityMat( n ) * z^0;
        mat[1][1] := z^p;
        Add( gens, mat );
    fi;
    if IsEmpty( gens ) then
        gens := [ IdentityMat( n ) ];             # G(m,m,1): trivial
    fi;

    return Group( gens );
end );

InstallGlobalFunction( SGV_UncheckedExceptionalOrders, function( )
    # Orders of G_4, ..., G_37 not built by SGV_IsAbstractlyComplexReflectionGroup.
    # The ones it does build -- G_4 = SL(2,3), G_23 = W(H3), G_28 = W(F4),
    # G_35 = W(E6) -- are omitted here.
    return [ 48, 72, 96, 144, 192, 240, 288, 336, 360, 576, 600, 648, 720,
             1200, 1296, 1800, 2160, 3600, 7680, 14400, 46080, 155520,
             2903040, 39191040, 696729600 ];
end );

#############################################################################
##  Internal machinery

BindGlobal( "SGV_ARG_Cache", rec( imprim := rec(), exc := rec(), byOrder := rec() ) );

#  G(m,p,n) as a permutation group on the m*n coordinate rays -- the same group
#  SGV_ImprimitiveReflectionGroup builds, but with no cyclotomic arithmetic, so
#  DirectFactorsOfGroup on it stays fast even for large m.
BindGlobal( "SGV_ARG_Imprim", function( m, p, n )
    local key, pt, gens, i, k, lst;
    key := Concatenation( String( m ), "_", String( p ), "_", String( n ) );
    if not IsBound( SGV_ARG_Cache.imprim.(key) ) then
        pt   := function( i, k ) return ( i - 1 ) * m + ( k mod m ) + 1; end;
        gens := [];
        for i in [ 1 .. n - 1 ] do                 # transposition (i, i+1)
            lst := [ 1 .. m * n ];
            for k in [ 0 .. m - 1 ] do
                lst[ pt( i, k ) ]   := pt( i + 1, k );
                lst[ pt( i + 1, k ) ] := pt( i, k );
            od;
            Add( gens, PermList( lst ) );
        od;
        if n >= 2 then                              # diag(z, z^-1, 1, ...)
            lst := [ 1 .. m * n ];
            for k in [ 0 .. m - 1 ] do
                lst[ pt( 1, k ) ] := pt( 1, k + 1 );
                lst[ pt( 2, k ) ] := pt( 2, k - 1 );
            od;
            Add( gens, PermList( lst ) );
        fi;
        if p < m then                              # diag(z^p, 1, ...)
            lst := [ 1 .. m * n ];
            for k in [ 0 .. m - 1 ] do
                lst[ pt( 1, k ) ] := pt( 1, k + p );
            od;
            Add( gens, PermList( lst ) );
        fi;
        if IsEmpty( gens ) then gens := [ () ]; fi;
        SGV_ARG_Cache.imprim.(key) := Group( gens );
    fi;
    return SGV_ARG_Cache.imprim.(key);
end );

BindGlobal( "SGV_ARG_Exceptional", function( name )
    local cartan, n, gens, i, j, mat, W;
    if not IsBound( SGV_ARG_Cache.exc.(name) ) then
        if name = "F4" then
            cartan := [ [  2, -1,  0,  0 ], [ -1,  2, -2,  0 ],
                        [  0, -1,  2, -1 ], [  0,  0, -1,  2 ] ];
            n := 4;  gens := [];
            for i in [ 1 .. n ] do
                mat := IdentityMat( n );
                for j in [ 1 .. n ] do mat[j][i] := mat[j][i] - cartan[i][j]; od;
                Add( gens, mat );
            od;
            W := Image( IsomorphismPermGroup( Group( gens ) ) );
        elif name = "H3" then
            W := DirectProduct( CyclicGroup( IsPermGroup, 2 ),
                                AlternatingGroup( 5 ) );
        elif name = "SL23" then
            W := Image( IsomorphismPermGroup( SL( 2, 3 ) ) );
        elif name = "E6" then
            W := SGV_Group( "WE6" );
        else
            Error( "SGV_ARG_Exceptional: unknown `", name, "'" );
        fi;
        SGV_ARG_Cache.exc.(name) := W;
    fi;
    return SGV_ARG_Cache.exc.(name);
end );

#  A cheap fingerprint for a directly-indecomposable group.  Not a complete
#  invariant, so a successful cover is confirmed with IsomorphismGroups before
#  it is reported (SGV_IsAbstractlyComplexReflectionGroup).  IdGroup is
#  deliberately avoided: it is very slow for highly composite orders (1152,
#  1536, ...).
BindGlobal( "SGV_ARG_FactorKey", function( g )
    return [ Size( g ),
             SortedList( AbelianInvariants( g ) ),
             Size( DerivedSubgroup( g ) ),
             NrConjugacyClasses( g ),
             Collected( List( ConjugacyClasses( g ),
                              c -> Order( Representative( c ) ) ) ) ];
end );

#  remaining and want are sorted lists (multisets); is `want` contained in it?
BindGlobal( "SGV_ARG_SubMultiset", function( want, have )
    local rest, x, i;
    rest := ShallowCopy( have );
    for x in want do
        i := Position( rest, x );
        if i = fail then return false; fi;
        Remove( rest, i );
    od;
    return true;
end );

BindGlobal( "SGV_ARG_MinusMultiset", function( have, want )
    local rest, x, i;
    rest := ShallowCopy( have );
    for x in want do
        Remove( rest, Position( rest, x ) );
    od;
    return rest;
end );

#  Every irreducible complex reflection group of order exactly `ord`, as a list
#  of rec( name, group, keys ), keys the sorted factor-key multiset.
BindGlobal( "SGV_ARG_IrreduciblesOfOrder", function( ord )
    local out, seen, addGrp, n, fn, bound, m, p;

    if IsBound( SGV_ARG_Cache.byOrder.( String( ord ) ) ) then
        return SGV_ARG_Cache.byOrder.( String( ord ) );
    fi;

    out  := [];
    seen := [];
    addGrp := function( name, W )
        local k;
        k := SortedList( List( DirectFactorsOfGroup( W ), SGV_ARG_FactorKey ) );
        if not k in seen then
            Add( seen, k );
            Add( out, rec( name := name, group := W, keys := k ) );
        fi;
    end;

    if ord >= 2 then                       # G(ord,1,1) = C_ord  (rank 1)
        addGrp( Concatenation( "G(", String( ord ), ",1,1)" ),
                CyclicGroup( IsPermGroup, ord ) );
    fi;

    n := 2;
    while Factorial( n ) <= ord do
        fn    := Factorial( n );
        bound := RootInt( QuoInt( ord, fn ), n - 1 ) + 1;
        for m in [ 1 .. bound ] do
            for p in DivisorsInt( m ) do
                if m ^ n * fn / p = ord then
                    addGrp( Concatenation( "G(", String( m ), ",", String( p ),
                                           ",", String( n ), ")" ),
                            SGV_ARG_Imprim( m, p, n ) );
                fi;
            od;
        od;
        n := n + 1;
    od;

    if ord = 24    then addGrp( "SL(2,3) [G4]",  SGV_ARG_Exceptional( "SL23" ) ); fi;
    if ord = 120   then addGrp( "W(H3) [G23]",   SGV_ARG_Exceptional( "H3" ) );   fi;
    if ord = 1152  then addGrp( "W(F4) [G28]",   SGV_ARG_Exceptional( "F4" ) );   fi;
    if ord = 51840 then addGrp( "W(E6) [G35]",   SGV_ARG_Exceptional( "E6" ) );   fi;

    SGV_ARG_Cache.byOrder.( String( ord ) ) := out;
    return out;
end );

#  All products of a sub-multiset of `orders` (the > 1 ones).
BindGlobal( "SGV_ARG_SubProducts", function( orders )
    local prods, o, new, x;
    prods := [ 1 ];
    for o in orders do
        new := [];
        for x in prods do
            Add( new, x );
            Add( new, x * o );
        od;
        prods := Set( new );
    od;
    return Filtered( prods, x -> x > 1 );
end );

#  Returns a list of the chosen rec( name, group, keys ), or fail.
DeclareGlobalFunction( "SGV_ARG_Cover" );
InstallGlobalFunction( SGV_ARG_Cover, function( remaining, orders )
    local first, ord, cand, deeper;
    if IsEmpty( remaining ) then
        return [];
    fi;
    first := remaining[1];
    for ord in orders do
        for cand in SGV_ARG_IrreduciblesOfOrder( ord ) do
            if first in cand.keys and SGV_ARG_SubMultiset( cand.keys, remaining ) then
                deeper := SGV_ARG_Cover(
                    SGV_ARG_MinusMultiset( remaining, cand.keys ), orders );
                if deeper <> fail then
                    return Concatenation( [ cand ], deeper );
                fi;
            fi;
        od;
    od;
    return fail;
end );

#############################################################################

InstallGlobalFunction( SGV_IsAbstractlyComplexReflectionGroup, function( G )
    local H, gfac, keys, orders, covered, model;

    if Size( G ) = 1 then
        return rec( isComplexReflectionGroup := true, factors := [ ] );
    fi;

    H := G;
    if not IsPermGroup( H ) then
        H := Image( IsomorphismPermGroup( H ) );
    fi;

    gfac   := DirectFactorsOfGroup( H );
    keys   := SortedList( List( gfac, SGV_ARG_FactorKey ) );
    orders := SGV_ARG_SubProducts( List( gfac, Size ) );

    covered := SGV_ARG_Cover( keys, orders );
    if covered <> fail then
        # the fingerprint match is not a proof; confirm the isomorphism
        model := DirectProduct( List( covered, c -> c.group ) );
        if IsomorphismGroups( H, model ) <> fail then
            return rec( isComplexReflectionGroup := true,
                        factors := SortedList( List( covered, c -> c.name ) ) );
        fi;
    fi;

    if Size( G ) in SGV_UncheckedExceptionalOrders() then
        return rec( isComplexReflectionGroup := "inconclusive",
                    note := Concatenation(
                        "not a product of imprimitive reflection groups; order ",
                        String( Size( G ) ), " also occurs among the exceptional ",
                        "groups G_4..G_37 that are not built in" ),
                    indecomposableFactors := keys );
    fi;

    return rec( isComplexReflectionGroup := false,
                indecomposableFactors := keys );
end );

InstallGlobalFunction( SGV_AssertIsAbstractlyComplexReflectionGroup, function( G )
    local r;
    r := SGV_IsAbstractlyComplexReflectionGroup( G );
    if r.isComplexReflectionGroup = true then
        return true;
    fi;
    return r;
end );
