{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    go
    gopls # LSP
    gotools # goimports, godoc, etc
    golangci-lint # linter
    delve # debugger
  ];
  shellHook = ''
    exec $SHELL
  '';
}
