let
  pkgs = import ./pkgs.nix;
  hp = pkgs.haskellPackages;
  project = hp.callPackage ./default.nix {};

  # Load cabal project
  drv = pkgs.haskell.lib.addBuildTools project (
    [ hp.cabal-install hp.hdevtools ]
  );
in
  if pkgs.lib.inNixShell then drv.env else drv
