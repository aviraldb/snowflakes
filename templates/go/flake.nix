{
  description = "<Enter your Go project description>";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      appname = "<appname>";
      version = "<version>";
      pkgs = import nixpkgs { inherit system; };
      app = import ./nix/packages.nix { inherit pkgs appname version; };
      shell = import ./nix/shell.nix { inherit pkgs; };
    in
    {
      packages = {
        "${appname}" = app;
        default = app;
      };
      devShells.default = shell.default;
    });
}
