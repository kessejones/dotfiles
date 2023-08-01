if type -q exa
    alias ll "exa --long --group"
    alias la "ll --all"
    alias lt "exa --icons --tree"
    alias lt2 "lt -L 2"
    alias lt3 "lt -L 3"
    alias lt4 "lt -L 4"
    alias lt5 "lt -L 5"
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

switch (uname)
    case Darwin
        alias clip "reattach-to-user-namespace pbcopy"
    case Linux
        alias clip xclip
end
