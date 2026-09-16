#############################################################################
##
##  we6-classes.gi
##

InstallGlobalFunction( SGV_WE6ClassRow, function( g )
    local W, rows;

    W := SGV_Group( "WE6" );
    if not g in W then
        Error( "SGV_WE6ClassRow: g is not an element of WE6" );
    fi;

    rows := Filtered( SGV_WE6ConjugacyClassTable, r -> r.Ord = Order( g ) );
    if Length( rows ) = 1 then return rows[1]; fi;

    rows := Filtered( rows, r -> r.Tr = TraceMat( g ) );
    if Length( rows ) = 1 then return rows[1]; fi;

    rows := Filtered( rows, r -> r.C = Size( W ) / Size( ConjugacyClass( W, g ) ) );
    if Length( rows ) = 1 then return rows[1]; fi;

    rows := Filtered( rows, r -> r.Tr3 = TraceMat( g ^ 3 ) );
    if Length( rows ) = 1 then return rows[1]; fi;

    Error( "SGV_WE6ClassRow: could not identify the class of g" );
end );

InstallGlobalFunction( SGV_WE6AtlasLabel, function( g )
    return SGV_WE6ClassRow( g ).Atlas;
end );

InstallGlobalFunction( SGV_WE6CarterLabel, function( g )
    return SGV_WE6ClassRow( g ).Carter;
end );

InstallGlobalFunction( SGV_WE6ManinLabel, function( g )
    return SGV_WE6ClassRow( g ).Manin;
end );

InstallGlobalFunction( SGV_WE6ConjugacyClassesInSubgroup, function( H )
    local present;

    present := Set( List( ConjugacyClasses( H ),
                           c -> SGV_WE6AtlasLabel( Representative( c ) ) ) );

    # Report in the table's own Atlas order rather than string order (which
    # would put "12A" before "1A").
    return Filtered( List( SGV_WE6ConjugacyClassTable, r -> r.Atlas ),
                      label -> label in present );
end );
