function _fzf_change_directory_home --description "Search the current directory. Change current directory to selected path."
    set fd_opts --type d --color=always --strip-cwd-prefix $fzf_fd_opts

    set fzf_arguments --multi --ansi $fzf_dir_opts

    set --append fd_opts --base-directory=$HOME

    set --append fzf_arguments --header-first --header "Find directory ($HOME)"

    set --append fd_opts --exclude Applications/
    set --append fd_opts --exclude Library/
    set --append fd_opts --exclude Movies/
    set --append fd_opts --exclude Music/
    set --append fd_opts --exclude node_modules/

    set file_paths_selected (fd $fd_opts 2>/dev/null | _fzf_wrapper $fzf_arguments)

    if test $status -eq 0
        cd $HOME/$file_paths_selected
    end

    commandline --function repaint
end
