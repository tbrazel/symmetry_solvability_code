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

# Group definitions (data).
ReadPackage( "SymmetricGalois", "gap/groups/cubic-surfaces.g" );
ReadPackage( "SymmetricGalois", "gap/groups/plane-quartics.g" );

# Claims (assertions about that data).
ReadPackage( "SymmetricGalois", "gap/checks/subgroup-structure.gi" );
