if type -q exa
    alias ll "exa --long --group"
    alias la "ll --all"
    alias lt "ll --tree"
    alias tree "lt"
end

if type -q btop
    alias top btop
end

if type -q nvim
    alias n nvim
end

if type -q tmux
    alias t tmux
    alias ta "tmux -u new-session -A -s "
    alias tt "ta main"
end

if type -q docker
    alias d docker
    alias dc "docker compose"
end

if type -q docker-compose
    alias dc docker-compose
end

if type -q podman
    alias p podman
end

if type -q podman-compose
    alias pc podman-compose
end

alias g git
alias ips "ip -c -br a"
