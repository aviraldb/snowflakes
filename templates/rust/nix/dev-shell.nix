{ pkgs }:
let
  rustToolchain = import ./rust-toolchain.nix { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustToolchain
    cargo-watch
    cargo-nextest
    cargo-audit
    pkg-config
    openssl
  ];
  OPENSSL_NO_VENDOR = 1;
  shellHook = ''
    exec "$SHELL"
  '';
}
