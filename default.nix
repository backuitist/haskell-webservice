{ haskellPackages, mkDerivation, lib, stdenv }:

mkDerivation rec {
  pname = "package";
  version = "0.0.1";

  src = ./.;
  isLibrary = false;
  isExecutable = true;

  executableHaskellDepends = with haskellPackages;
    [ base
      scotty
      aeson
      protolude
    ];

  description = "description";
  license = lib.licenses.bsd3;
}
