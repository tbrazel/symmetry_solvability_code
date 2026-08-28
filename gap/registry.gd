#############################################################################
##
##  registry.gd -- the two registries this package is built around.
##
##  Groups are DATA: a record with explicit generators plus the invariants the
##  paper asserts for them.  Claims are FUNCTIONS keyed by the \label of the
##  statement they verify.  Nothing anywhere hard-codes a theorem number.
##

#! Register a group.  <A>data</A> is a record with components
#!   id      -- stable slug, e.g. "quartic-d8"  (NOT a section or type number)
#!   field   -- the field the matrix entries live in, e.g. CF(8), Rationals
#!   gens    -- list of matrices, as plain lists of lists
#! and optionally
#!   label   -- the \label where the group is introduced in the paper, if any
#!              (not every group -- e.g. background/setup groups -- is)
#!   type    -- the paper's Type numeral, as metadata only
#!   ambient -- informal note, e.g. "PGL_4"
#!   comment -- a sentence of prose
#!   claims  -- record of invariant name -> expected value, e.g.
#!              rec( Size := 8, IdGroup := [ 8, 3 ] )
DeclareGlobalFunction( "SGV_RegisterGroup" );

#! Return (and cache) the matrix group registered under <A>id</A>.
DeclareGlobalFunction( "SGV_Group" );

#! The record registered under <A>id</A>, generators and all.
DeclareGlobalFunction( "SGV_GroupData" );

#! All registered ids, in registration order.
DeclareGlobalFunction( "SGV_GroupIds" );

#! Recompute every declared invariant of every registered group.
#! Returns true, or a list of records describing the mismatches.
DeclareGlobalFunction( "SGV_CheckGroupData" );

#! Register a claim: SGV_RegisterClaim( label, description, function );
#! The function takes no arguments and returns true, or a record explaining
#! the failure.
DeclareGlobalFunction( "SGV_RegisterClaim" );

#! All registered claim labels, in registration order.
DeclareGlobalFunction( "SGV_ClaimLabels" );

#! Run one claim by label.
DeclareGlobalFunction( "SGV_RunClaim" );

#! Run every claim, printing a report.  Returns true iff all passed.
DeclareGlobalFunction( "SGV_RunAllClaims" );

#! Human-readable reference for a label ("Lemma 6.12" if gap/paper-refs.g has
#! been generated, otherwise the raw cross-reference macro).
DeclareGlobalFunction( "SGV_Reference" );
