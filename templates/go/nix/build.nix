{ pkgs, appname, version }:
{
  default = pkgs.buildGoModule {
    pname = appname;
    inherit version;
    src = ../.;
    # subPackages takes input as array of string of paths to subModules
    subPackages = [ ];
    vendorHash = null;
  };
}
