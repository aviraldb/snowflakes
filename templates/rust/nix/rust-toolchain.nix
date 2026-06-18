{ pkgs }:
pkgs.rust-bin.stable.latest.default.override {
  extensions = [ "rust-src" "rust-analyzer" "clippy" ];
  targets = [ ]; # add "wasm32-unknown-unknown" etc here
}
