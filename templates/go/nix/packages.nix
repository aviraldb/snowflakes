{ pkgs, appname, version }:
pkgs.buildGoModule {
  pname = appname;
  inherit version;
  src = ./.;
  vendorHash = null;
}
