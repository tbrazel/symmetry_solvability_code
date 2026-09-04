#############################################################################
##
##  group-theory.gi
##

InstallGlobalFunction( SGV_UniqueIndexTwoSubgroup, function( G )
    local N;

    # Preimage in G of Q^2, where Q = G / G'.  Q abelian, so Q^2 is generated
    # by the squares of the generators of Q; pulling back gives G' together
    # with the squares of the generators of G.
    N := ClosureGroup( DerivedSubgroup( G ),
                       List( GeneratorsOfGroup( G ), g -> g^2 ) );

    # [G:N] = [Q : Q^2] = 2^d.  Index 1 => no subgroup of index 2;
    # index > 2 => 2^d - 1 > 1 of them.  Exactly 2 => the unique one.
    if Index( G, N ) = 2 then
        return N;
    else
        return fail;
    fi;
end );
