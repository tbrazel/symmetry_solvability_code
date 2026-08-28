#############################################################################
##
##  registry.gi
##

BindGlobal( "SGV_Registry", rec(
    groups     := rec(),
    groupOrder := [],
    claims     := rec(),
    claimOrder := [] ) );

#############################################################################
##  Groups

InstallGlobalFunction( SGV_RegisterGroup, function( data )
    local field, entry;

    for field in [ "id", "field", "gens" ] do
        if not IsBound( data.(field) ) then
            Error( "SGV_RegisterGroup: missing component `", field, "'" );
        fi;
    od;
    if IsBound( SGV_Registry.groups.( data.id ) ) then
        Error( "SGV_RegisterGroup: duplicate id `", data.id, "'" );
    fi;
    if not IsBound( data.gens ) or IsEmpty( data.gens ) then
        Error( "SGV_RegisterGroup: `", data.id, "' has no generators" );
    fi;

    entry := ShallowCopy( data );
    if not IsBound( entry.claims ) then entry.claims := rec(); fi;

    SGV_Registry.groups.( entry.id ) := entry;
    Add( SGV_Registry.groupOrder, entry.id );
end );

InstallGlobalFunction( SGV_GroupData, function( id )
    if not IsBound( SGV_Registry.groups.(id) ) then
        Error( "no group registered under id `", id, "'" );
    fi;
    return SGV_Registry.groups.(id);
end );

InstallGlobalFunction( SGV_GroupIds, function( )
    return ShallowCopy( SGV_Registry.groupOrder );
end );

InstallGlobalFunction( SGV_Group, function( id )
    local entry, one, gens;

    entry := SGV_GroupData( id );
    if not IsBound( entry.group ) then
        # Coerce entries into the declared field.  For a cyclotomic field
        # One(F) is 1, so entries like E(8) pass through untouched; for GF(q)
        # this turns integer entries into field elements.
        one  := One( entry.field );
        gens := List( entry.gens,
                      m -> List( m, row -> List( row, x -> x * one ) ) );
        entry.group := Group( gens );
        SetName( entry.group, Concatenation( "SGV(", id, ")" ) );
    fi;
    return entry.group;
end );

InstallGlobalFunction( SGV_CheckGroupData, function( )
    local bad, id, entry, G, name, expected, actual;

    bad := [];
    for id in SGV_Registry.groupOrder do
        entry := SGV_Registry.groups.(id);
        G     := SGV_Group( id );
        for name in RecNames( entry.claims ) do
            expected := entry.claims.(name);
            # `name' is an attribute name such as "Size" or "IdGroup".
            actual := ValueGlobal( name )( G );
            if actual <> expected then
                Add( bad, rec( id := id, invariant := name,
                               expected := expected, actual := actual ) );
            fi;
        od;
    od;

    if IsEmpty( bad ) then
        return true;
    fi;
    return bad;
end );

#############################################################################
##  Claims

InstallGlobalFunction( SGV_Reference, function( label )
    local refs;
    if IsBoundGlobal( "SGV_PaperRefs" ) then
        refs := ValueGlobal( "SGV_PaperRefs" );
        if IsBound( refs.(label) ) then
            return refs.(label);
        fi;
    fi;
    return Concatenation( "\\Cref{", label, "}" );
end );

InstallGlobalFunction( SGV_RegisterClaim, function( label, description, fn )
    if IsBound( SGV_Registry.claims.(label) ) then
        Error( "SGV_RegisterClaim: duplicate label `", label, "'" );
    fi;
    SGV_Registry.claims.(label) := rec( label       := label,
                                        description := description,
                                        check       := fn );
    Add( SGV_Registry.claimOrder, label );
end );

InstallGlobalFunction( SGV_ClaimLabels, function( )
    return ShallowCopy( SGV_Registry.claimOrder );
end );

InstallGlobalFunction( SGV_RunClaim, function( label )
    if not IsBound( SGV_Registry.claims.(label) ) then
        Error( "no claim registered under label `", label, "'" );
    fi;
    return SGV_Registry.claims.(label).check();
end );

InstallGlobalFunction( SGV_RunAllClaims, function( )
    local width, ok, label, claim, result;

    width := 0;
    for label in SGV_Registry.claimOrder do
        width := Maximum( width, Length( SGV_Reference( label ) ) );
    od;

    ok := true;
    for label in SGV_Registry.claimOrder do
        claim  := SGV_Registry.claims.(label);
        result := claim.check();
        if result = true then
            Print( "  PASS  " );
        else
            Print( "  FAIL  " );
            ok := false;
        fi;
        Print( String( SGV_Reference( label ), -width ), "  ",
               claim.description, "\n" );
        if result <> true then
            Print( "        ", label, ": ", result, "\n" );
        fi;
    od;

    return ok;
end );
