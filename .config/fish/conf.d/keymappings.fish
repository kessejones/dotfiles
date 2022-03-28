set -g fish_key_bindings fish_vi_key_bindings

bind -M insert \[aa accept-autosuggestion
bind -M normal \[aa accept-autosuggestion

bind -M insert \cj 'set fish_bind_mode default; commandline -f repaint'
