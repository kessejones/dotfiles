function __fuzzy_git_repos
    set -l fd_opts --type d --hidden --no-ignore-vcs --format="{//}" --base-directory $HOME --search-path "src" --search-path "Projects" --regex ".git\$"

    set -l sk_opts --preview "git -C $HOME/{} log -n 5 --pretty=medium --all --graph --color" \
        --bind=ctrl-u:half-page-up,ctrl-d:half-page-down

    set -l selected (fd $fd_opts | sk $sk_opts)

    if test -n "$selected"
        cd $HOME/$selected
    end
end
