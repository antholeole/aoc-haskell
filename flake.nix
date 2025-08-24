{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [];
      perSystem = {
        self',
        system,
        lib,
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "haskell-devshell";
          packages = with pkgs; [
            haskellPackages.cabal-install
          ];
        };
      };
    };
}
