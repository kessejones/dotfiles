if type -q exa
    alias ll "exa --long --group --icons"
    alias la "ll --all"
    alias lt "exa --all --tree --icons"
    alias tree "lt"
end

if type -q btop
    alias top btop
end

alias g git
alias n nvim
alias t tmux
alias ta "tmux -u new-session -A -s "
alias tmain "ta main"
alias d docker
alias dc docker-compose

