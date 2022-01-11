# general
set -gx EDITOR nvim

# theme
#set -g theme_color_scheme terminal-dark
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname yes
#set -g theme_hostname no 

# aliases
alias g git
alias v nvim
alias t tmux

set -g fish_key_bindings fish_vi_key_bindings

bind -M insert \[aa accept-autosuggestion
bind -M normal \[aa accept-autosuggestion
