if type -q exa
    alias ll "exa --long --group"
    alias la "ll --all"
    alias lt "ll --tree"
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
alias p podman
alias pc podman-compose

alias ips "ip -c -br a"
