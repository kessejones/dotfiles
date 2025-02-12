function __change_home_directory
    set -l dir (cd $HOME && tv dirs)
    if test -n "$dir"
        cd $dir
    end
end
