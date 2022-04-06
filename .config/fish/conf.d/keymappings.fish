set -g fish_key_bindings fish_vi_key_bindings

bind -M insert \[aa accept-autosuggestion
bind -M normal \[aa accept-autosuggestion

bind -M insert \cs _fzf_search_git_status
bind -M insert \cg _fzf_search_git_log
bind -M insert \cf _fzf_search_directory

bind -M insert \cj 'set fish_bind_mode default; commandline -f repaint'
