function fish_user_key_bindings
    # bind -M insert \cj _normal_mode

    bind --user -M insert \ch _fzf_change_directory_home
    bind --user -M insert \cb '_bookmarks -m list'
    bind --user -M insert \cw '_bookmarks -m save'
    bind --user -M insert \cx '_bookmarks -m remove'
    bind --user -M insert \ce dotconf
    bind --user -M insert \cf accept-autosuggestion
    bind --user -M insert \cg accept-autosuggestion execute

    set -g fish_key_bindings fish_vi_key_bindings
end
