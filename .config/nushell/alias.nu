export alias g = git
export alias tt = tmux
export alias dc = docker compose
export alias d = docker
export alias ll = ls -a
export alias top = btop
export alias z = zoxide
export alias n = nvim

def __attach_zellij [] {
    let session = "main"
    if ((zellij attach $session | complete | get exit_code) == 1) {
        zellij --session $session
    }
}

export alias ze = __attach_zellij
