# Getting Started

- Install nix (https://nixos.org/nix/)
- Start a nix shell
- Run cabal as per usual

```bash
$ nix-shell
> cabal run
```

## Update `nixpkgs.json`

```bash
$ nix-shell -p nix-prefetch-git
$ nix-prefetch-git https://github.com/nixos/nixpkgs-channels.git refs/heads/nixos-18.09
```