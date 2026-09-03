#############################################################################
##
##  abstract-reflection.tst -- SGV_IsAbstractlyComplexReflectionGroup and the
##  imprimitive-group constructor behind it.  Print booleans and small data.
##
gap> START_TEST( "abstract-reflection.tst" );

##  The imprimitive family G(m,p,n) has the expected order in each regime.
gap> List( [ [1,1,4], [2,1,3], [2,2,3], [3,1,2], [6,6,2], [4,2,3], [6,3,1] ],
>          t -> Size( SGV_ImprimitiveReflectionGroup( t[1], t[2], t[3] ) ) );
[ 24, 48, 24, 18, 12, 192, 2 ]

##  Groups that are complex reflection groups, with the factorisation found.
gap> f := G -> SGV_IsAbstractlyComplexReflectionGroup( G );;
gap> r := f( SymmetricGroup( 5 ) );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "G(1,1,5)" ] ]
gap> r := f( CyclicGroup( 6 ) );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "G(2,1,1)", "G(3,1,1)" ] ]
gap> r := f( DihedralGroup( 8 ) );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "G(2,1,2)" ] ]
gap> r := f( DirectProduct( CyclicGroup( 2 ), SymmetricGroup( 4 ) ) );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "G(2,1,1)", "G(2,2,3)" ] ]
gap> r := f( SL( 2, 3 ) );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "SL(2,3) [G4]" ] ]

##  W(F4) = G_28.  Built here from its Cartan matrix; this is (abstractly) the
##  normaliser in W(E6) of the Type XI cubic-surface group.
gap> cartan := [ [2,-1,0,0], [-1,2,-2,0], [0,-1,2,-1], [0,0,-1,2] ];;
gap> gens := List( [1..4], i -> List( [1..4], function( j )
>        local row; row := ShallowCopy( IdentityMat( 4 )[j] );
>        row[i] := row[i] - cartan[i][j]; return row; end ) );;
gap> WF4 := Group( gens );;  Size( WF4 );
1152
gap> r := f( WF4 );;
gap> [ r.isComplexReflectionGroup, r.factors ];
[ true, [ "W(F4) [G28]" ] ]

##  Groups that are NOT complex reflection groups.
gap> f( QuaternionGroup( 8 ) ).isComplexReflectionGroup;
false
gap> f( AlternatingGroup( 4 ) ).isComplexReflectionGroup;
false
gap> f( AlternatingGroup( 5 ) ).isComplexReflectionGroup;
false
gap> f( SmallGroup( 24, 1 ) ).isComplexReflectionGroup;
false

##  An order that coincides with an exceptional group we do not build is
##  reported as inconclusive rather than false.
gap> 48 in SGV_UncheckedExceptionalOrders();
true
gap> f( SmallGroup( 48, 28 ) ).isComplexReflectionGroup;  # C2 . S4, not a CRG
"inconclusive"

gap> STOP_TEST( "abstract-reflection.tst" );
