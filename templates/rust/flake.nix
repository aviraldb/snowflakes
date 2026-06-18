{
  description = "<Insert your description>";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        appname = "<appname>";
        version = "<version>";
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        shell = import ./nix/shell.nix { inherit pkgs; };
        build = import ./nix/build.nix { inherit appname version pkgs overlays; };
      in
      {
        devShells.default = shell.default;
        package = {
          "${appname}" = build.default;
          default = build.default;
        };
      }
    );
}
