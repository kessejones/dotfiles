function fish_user_key_bindings
    # bind -M insert \cj _normal_mode
    bind --erase -- \ct
    bind --erase --mode insert -- \ct

    bind --user -M insert \ch _fzf_change_directory_home
    bind --user -M insert \cb '_bookmarks -m list'
    # bind --user -M insert \cw '_bookmarks -m save'
    bind --user -M insert \cx '_bookmarks -m remove'
    bind --user -M insert \ce dotconf
    bind --user -M insert \cf accept-autosuggestion
    bind --user -M insert \cg accept-autosuggestion execute
    bind --user -M insert \cr _fzf_search_history
    bind --user -M insert \cgl _fzf_search_git_log

    bind --user -M default gl end-of-line
    bind --user -M default gh beginning-of-line

    bind --user -M insert \co '$EDITOR'
    bind --user -M insert \cp __fish_toggle_private_mode

    set -g fish_key_bindings fish_vi_key_bindings
end
