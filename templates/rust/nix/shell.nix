{ pkgs }:
let
  rustToolchain = import ./rust-toolchain.nix { inherit pkgs; };
in
{
  default = pkgs.mkShell {
    buildInputs = with pkgs; [
      rustToolchain
      cargo-watch
      cargo-nextest
      cargo-audit
      pkg-config
      openssl
    ];
    packages = with pkgs; [
      fish
    ];
    OPENSSL_NO_VENDOR = 1;
    shellHook = ''
      exec /bin/fish
    '';
  };
}
