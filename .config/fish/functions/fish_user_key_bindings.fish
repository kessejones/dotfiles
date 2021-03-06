function fish_user_key_bindings
    bind -M insert \cj _normal_mode

    bind -M insert \cs _fzf_search_git_status
    bind -M insert \cg _fzf_search_git_log
    bind -M insert \cf _fzf_search_directory
    bind -M insert \ce _fzf_change_directory
    bind -M insert \ch _fzf_change_directory_home

    bind -M insert \cb '_bookmark -m list'
    bind -M insert \ca '_bookmark -m save'
    bind -M insert \cx '_bookmark -m remove'

    bind --preset -M insert -k nul accept-autosuggestion

    set -g fish_key_bindings fish_vi_key_bindings
end
