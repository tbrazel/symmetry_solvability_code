#############################################################################
##
##  group-theory.tst -- reusable helpers in gap/lib/group-theory.gi.
##
gap> START_TEST( "group-theory.tst" );

##  SGV_UniqueIndexTwoSubgroup: the unique index-2 subgroup when there is one.
gap> SGV_UniqueIndexTwoSubgroup( SymmetricGroup( 4 ) ) = AlternatingGroup( 4 );
true
gap> IdGroup( SGV_UniqueIndexTwoSubgroup( CyclicGroup( 8 ) ) );
[ 4, 1 ]
gap> IdGroup( SGV_UniqueIndexTwoSubgroup( DihedralGroup( 10 ) ) );
[ 5, 1 ]
gap> IsTrivial( SGV_UniqueIndexTwoSubgroup( CyclicGroup( 2 ) ) );
true

##  fail when there is no index-2 subgroup ...
gap> SGV_UniqueIndexTwoSubgroup( AlternatingGroup( 5 ) );
fail
gap> SGV_UniqueIndexTwoSubgroup( CyclicGroup( 3 ) );
fail

##  ... and when there are several (here C2 x C2 has three).
gap> SGV_UniqueIndexTwoSubgroup( DirectProduct( CyclicGroup( 2 ), CyclicGroup( 2 ) ) );
fail
gap> SGV_UniqueIndexTwoSubgroup( DihedralGroup( 8 ) );
fail

##  Cross-check against a brute-force enumeration on a handful of small groups.
gap> naive := function( G )
>        local c;
>        c := Filtered( NormalSubgroups( G ), N -> Index( G, N ) = 2 );
>        if Length( c ) = 1 then return c[1]; else return fail; fi;
>    end;;
gap> ForAll( AllSmallGroups( [ 1 .. 32 ] ), function( G )
>        local a, b;
>        a := SGV_UniqueIndexTwoSubgroup( G );
>        b := naive( G );
>        return ( a = fail and b = fail ) or ( a <> fail and b <> fail and a = b );
>    end );
true

gap> STOP_TEST( "group-theory.tst" );
