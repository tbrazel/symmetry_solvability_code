#
# SymmetricGalois: implementations.
#
# Order matters: the registry must exist before any group or claim file
# registers into it, and the generated reference table (if present) must be
# read before any report is printed.
#
ReadPackage( "SymmetricGalois", "gap/registry.gi" );

if IsReadableFile( Filename( DirectoriesPackageLibrary( "SymmetricGalois", "gap" ),
                             "paper-refs.g" ) ) then
    ReadPackage( "SymmetricGalois", "gap/paper-refs.g" );
fi;

# Reference data: ATLAS/Carter/Manin labels for the conjugacy classes of
# WE6 (external data, not computed by this package -- see the file header).
# Read before gap/lib/we6-classes.gi, which looks names up in it.
ReadPackage( "SymmetricGalois", "data/we6-conjugacy-classes.g" );

# Reusable helpers.
ReadPackage( "SymmetricGalois", "gap/lib/group-theory.gi" );
ReadPackage( "SymmetricGalois", "gap/lib/we6-classes.gi" );

# Group definitions (data).
ReadPackage( "SymmetricGalois", "gap/groups/cubic-surfaces.g" );
ReadPackage( "SymmetricGalois", "gap/groups/cubic-monodromy-groups.g" );
ReadPackage( "SymmetricGalois", "gap/groups/plane-quartics.g" );

# Cached computations (see data/README.md).
ReadPackage( "SymmetricGalois", "data/plane-quartic-normalizers.g" );

# Monodromy groups depend on the cached nType* normalizers above.
ReadPackage( "SymmetricGalois", "gap/groups/quartic-monodromy-groups.g" );

# Claims (assertions about that data).
ReadPackage( "SymmetricGalois", "gap/checks/subgroup-structure.gi" );
ReadPackage( "SymmetricGalois", "gap/checks/complex-reflection.gi" );
ReadPackage( "SymmetricGalois", "gap/checks/abstract-reflection.gi" );
