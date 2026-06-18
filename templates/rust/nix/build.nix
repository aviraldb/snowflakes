{ pkgs, overlay, appname, version }:
{
  default = pkgs.rustPlatform.buildRustPackage {
    pname = appname;
    version = version;
    cargoLock.lockFile = ../Cargo.lock;
    src = pkgs.lib.cleanSource ../.;
  };
}
