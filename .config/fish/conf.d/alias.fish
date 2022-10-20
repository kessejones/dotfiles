if type -q exa
    alias ll "exa --long --group --icons"
    alias la "ll --all"
    alias tree "exa --tree --icons"
end

if type -q btop
    alias top btop
end

alias g git
alias n nvim
alias t tmux
alias tmain "tmux -u new-session -A -s main"
alias d docker
alias dc docker-compose

