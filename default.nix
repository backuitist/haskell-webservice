let
  pkgs = import ./pkgs.nix;
  klarna-webservice-scotty = pkgs.haskellPackages.callCabal2nix "project" ./. {};
in
{
    inherit klarna-webservice-scotty;
}