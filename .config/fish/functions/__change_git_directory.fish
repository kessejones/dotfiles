function __change_git_directory
    set -l repo (tv my-repositories)
    if test -n "$repo"
        cd $HOME/$repo
    end
end
