if type -q eza
    alias lt "eza --icons --tree"
end

if type -q lazygit
    alias lg lazygit
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

if type -q podman
    alias p podman
    alias pc "podman compose"
end


if type -q lazydocker
    alias lz lazydocker
end

if type -q bat
    alias b bat
end

if type -q zellij
    alias ze "zellij attach main || zellij --session main"
end

if type -q yazi
    alias y yazi
end

switch (uname)
    case Darwin
        alias clip "reattach-to-user-namespace pbcopy"
    case Linux
        if type -q xclip
            alias clip xclip
        end

        alias ips "ip -c -br a"
end
