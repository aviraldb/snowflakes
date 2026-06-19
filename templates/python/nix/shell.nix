{ pkgs, system }:
{
  default = {
    packages = with pkgs; [
      fish
      # Install Python with defined packages
      (python3.withPackages (pythonpkgs: with pythonpkgs; [
        # numpy
      ]))
    ];

    # Exposes required c/c++ libraries to shell
    env.LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      stdenv.cc.cc.lib
      libz
    ];
  };
}
