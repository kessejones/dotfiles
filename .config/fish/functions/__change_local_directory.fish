function __change_local_directory
    set -l dir (tv dirs)
    if test -n "$dir"
        cd $dir
    end
end
