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
      generic-random # to build generic Arbitrary instances
      hw-kafka-client
      hspec
      tasty
      tasty-discover
      tasty-hspec
      tasty-hunit
      tasty-quickcheck
      hspec-golden-aeson
      QuickCheck
      quickcheck-instances # provides Arb. instances for types such as Text, UUID, ...
    ];

  description = "description";
  license = lib.licenses.bsd3;
}
