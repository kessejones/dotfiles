{
    allowUnfree = true;

    packageOverrides = pkgs: with pkgs; {
        all = pkgs.buildEnv {
            name = "all";

            paths = [
                neovim
                fzf
                fish
                tmux
                btop
                tree-sitter
                ripgrep
                exa
                gnused
            ];

            pathsToLink = [ "/share/" "/bin" ];
        };
    };
}
