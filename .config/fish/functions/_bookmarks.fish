function _create_file
    set -l force $argv

    if not test -e "$save_file"
        or test $force -eq 1
        cat /dev/null > $save_file
    end
end

function _save
    set -l current $argv
    set -l all (cat $save_file)

    if test -n "$current"
        echo $current >> $save_file
    end
end

function _remove
    set -l current $argv
    set -l all (cat $save_file)

    if not contains $current $all
        return
    end

    for i in (seq (count $all))
        if test $current = $all[$i]
            set -e all[$i]
            break
        end
    end

    _create_file 1
    if test -n "$all"
        for item in $all
            echo $item >> $save_file
        end
    end
end

function _list
    clear
    set -l list (cat $save_file)
    if test -n "$list"
        set -l selected (gum choose --limit 1 $list)
        if test -n "$selected"
            cd $selected
        end
    else
        echo "Empty bookmarks"
    end
end

function _bookmarks
    set -g save_file $HOME/.cache/bookmarks
    set -l current (pwd)

    argparse 'm/mode=' 'p/path=' -- $argv

    if test -n "$_flag_p"
        set current $_flag_p
    end

    _create_file 0
    switch $_flag_m
        case save
            _save $current
        case remove
            _remove $current
        case list
            _list
    end

    commandline --function repaint
end
