function __change_git_directory
    set -l repo (tv git-repos)
    if test -n "$repo"
        cd $repo
    end
end
