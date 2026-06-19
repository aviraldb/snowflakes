{ pkgs, appname, version }:
{
  default = {
    pname = appname;
    version = version;

    src = ../.;

    format = "";

    buildInputs = [ ];
    checkInputs = [ ];
    nativeBuildInputs = [ ];
    propogatedBuildInputs = [ ];
  };
}
