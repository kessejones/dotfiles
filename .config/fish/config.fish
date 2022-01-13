# general
set -gx EDITOR nvim

set fish_greeting

# theme
#set -g theme_color_scheme terminal-dark
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname yes
#set -g theme_hostname no 

set fish_color_command green
set fish_color_autosuggestion grey 

# aliases
alias g git
alias v nvim
alias t tmux

set -g fish_key_bindings fish_vi_key_bindings

bind -M insert \[aa accept-autosuggestion
bind -M normal \[aa accept-autosuggestion

fish_add_path ~/.local/bin

if test -f ~/.user-config.fish
    source ~/.user-config.fish
end
