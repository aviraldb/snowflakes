{
    description = "<Enter project description>";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils } :
    flake-utils.lib.eachDefaultSystem (system: 
    let 
        appname = "appname";
        version = "version";
        pkgs = import nixpkgs { inherit system; };

        build = import ./nix/build.nix { inherit pkgs appname version; };
        shell = import ./nix/shell.nix { inherit pkgs system; };
    in {
        devShells.default = shell.default;
        packages = {
            "${appname}" = build.default;
            default = build.default;
        };
    });
}
