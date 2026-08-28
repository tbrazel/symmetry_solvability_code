#
# SymmetricGalois: run the whole (fast) test suite.
#
# This is what gap-actions/run-pkg-tests executes by default.
#
LoadPackage( "SymmetricGalois" );

# Fix the line width so that wrapping differences between environments do not
# show up as test failures.
SizeScreen( [ 80, ] );

TestDirectory( DirectoriesPackageLibrary( "SymmetricGalois", "tst" ),
               rec( exitGAP     := true,
                    testOptions := rec( compareFunction := "uptowhitespace" ) ) );

FORCE_QUIT_GAP( 1 );   # only reached if TestDirectory failed to exit
