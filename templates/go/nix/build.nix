{ pkgs, appname, version }:
{
  default = pkgs.buildGoModule {
    pname = appname;
    inherit version;
    src = ../.;
    subPackages = [ ];
    vendorHash = null;
  };
}
