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

    if test -n "$all"
        echo $all > $save_file
    else
        _create_file 1
    end
end

function _list
    set --append fzf_arguments --header-first --header 'Bookmark'
    set --append fzf_arguments --bind "ctrl-x:execute(_bookmark -m remove -p '{}')+reload(cat $save_file | sort)"
    set -l selected (cat $save_file | sort | _fzf_wrapper $fzf_arguments)
    if test $status -eq 0
        if test -n "$selected"
            cd $selected
        end
    end
end

function _bookmark
    set -g save_file $HOME/.cache/bookmark
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
