#############################################################################
##
##  abstract-reflection.gd
##
##  "Is this abstract group isomorphic to a complex reflection group?" --
##  independent of any representation.  A complex reflection group is a direct
##  product of irreducible ones, and the irreducible ones are (Shephard-Todd):
##
##    * the imprimitive family  G(m,p,n),  p | m,  which already contains the
##      cyclic groups (n = 1), the symmetric groups G(1,1,n) = S_n, the Weyl
##      groups of type B_n = G(2,1,n) and D_n = G(2,2,n), and the dihedral
##      groups I_2(m) = G(m,m,2);
##    * 34 exceptional groups G_4, ..., G_37.
##
##  The imprimitive family is handled exactly, by construction.  Of the
##  exceptionals only the ones cheap to build over Q are checked -- currently
##  W(F4) = G_28 and W(E6) = G_35; see SGV_UncheckedExceptionalOrders for the
##  ones a match is NOT tested against, so that a "no" of the right order is
##  reported as inconclusive rather than false.
##

#! The imprimitive reflection group <M>G(m,p,n)</M> (<A>p</A> divides <A>m</A>),
#! as a group of <M>n \times n</M> monomial matrices over
#! <C>CF( m )</C>.  <M>G(m,p,1)</M> is cyclic of order <M>m/p</M>;
#! <M>G(m,m,1)</M> is trivial.
DeclareGlobalFunction( "SGV_ImprimitiveReflectionGroup" );

#! Orders of the exceptional complex reflection groups that
#! <Ref Func="SGV_IsAbstractlyComplexReflectionGroup"/> does not build and so
#! cannot confirm a match against.  A group whose order is in this list, and
#! which is not otherwise identified, is reported as <C>"inconclusive"</C>.
DeclareGlobalFunction( "SGV_UncheckedExceptionalOrders" );

#! Whether the finite group <A>G</A> is isomorphic to a complex reflection
#! group.  Returns a record with
#!   <C>isComplexReflectionGroup</C> -- <C>true</C>, <C>false</C>, or
#!     <C>"inconclusive"</C> (order coincides with an exceptional group that is
#!     not built in; see <Ref Func="SGV_UncheckedExceptionalOrders"/>);
#!   <C>factors</C> -- on <C>true</C>, the names of the irreducible factors,
#!     e.g. <C>[ "G(1,1,3)", "G(2,1,1)" ]</C> or <C>[ "W(F4) [G28]" ]</C>;
#!   <C>indecomposableFactors</C> -- on <C>false</C>, the IdGroup (or a coarser
#!     fingerprint) of each directly-indecomposable factor of <A>G</A>.
DeclareGlobalFunction( "SGV_IsAbstractlyComplexReflectionGroup" );

#! Claim helper wrapping <Ref Func="SGV_IsAbstractlyComplexReflectionGroup"/>:
#! returns <C>true</C> when <A>G</A> is isomorphic to a complex reflection
#! group, otherwise the diagnostic record.  An <C>"inconclusive"</C> result is
#! treated as a failure -- resolve it by hand or by extending the built-in
#! exceptional list.
DeclareGlobalFunction( "SGV_AssertIsAbstractlyComplexReflectionGroup" );
