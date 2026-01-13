function __fuzzy_git_repos
    set -l fd_opts --type d --hidden --no-ignore-vcs --format="{//}" --base-directory $HOME --regex ".git\$"

    if test -d "$HOME/src"
        set -a fd_opts --search-path "src"
    end

    if test -d "$HOME/Projects"
        set -a fd_opts --search-path "Projects" 
    end

    set -l sk_opts \
        --preview "git -C $HOME/{} log -n 5 --pretty=medium --all --graph --color" \
        --bind=ctrl-u:half-page-up,ctrl-d:half-page-down

    if test -n "$ZELLIJ"
        set -l scripts_path "$HOME/.config/zellij/scripts"

        set -a sk_opts \
            --bind ctrl-e:execute-silent[$scripts_path/new-tab.sh {}] \
            --bind ctrl-s:execute-silent[$scripts_path/new-pane.sh {} right] \
            --bind ctrl-b:execute-silent[$scripts_path/new-pane.sh {} down] \
            --bind ctrl-o:execute-silent[$scripts_path/new-pane.sh {} floating]
    end

    set -l selected (fd $fd_opts | sk $sk_opts --print0)

    if test -n "$selected"
        cd $HOME/$selected
    end
end
