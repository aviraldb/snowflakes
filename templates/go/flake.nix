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
      build = import ./nix/build.nix { inherit pkgs appname version; };
      shell = import ./nix/shell.nix { inherit pkgs; };
    in
    {
      packages = {
        "${appname}" = build.default;
        default = build.default;
      };
      devShells.default = shell.default;
    });
}
