function __change_zoxide_directory
    set -l dir (tv my-zoxide)
    if test -n "$dir"
        cd $dir
    end
end
