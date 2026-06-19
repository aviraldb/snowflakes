{ pkgs }:
{
    default = pkgs.mkShell {
        packages = with pkgs; [
            go
                gopls # LSP
                gotools # goimports, godoc, etc
                golangci-lint # linter
        ];
        shellHook = ''
            exec /bin/fish
            '';
    };
}
