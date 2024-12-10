export alias g = git
export alias tt = tmux
export alias dc = docker compose
export alias d = docker
export alias ll = ls -a
export alias top = btop
export alias n = nvim
export alias lz = lazydocker
export alias y = yazi

# Alias for df -h with table format
export def dfh [] {
  df -h | str replace "Mounted on" Mounted_on | detect columns
}

# Open a new zellij session or attach to an existing one
export def ze [] {
    const session = "main"

    if (zellij list-sessions | lines | find $session | is-empty) {
      zellij --session $session
    } else {
      zellij attach $session
    }
}

# Alias for ls with type sorting
export def l [ ...args:string ] {
  let args = if ($args | length) == 0 {
    ["."]
  } else {
    $args
  }

  ls ...$args | sort-by type
}

# Alias for ls -la
export def la [...args] {
  let args = if ($args | length) == 0 {
    ["."]
  } else {
    $args
  }

  ls -la ...$args | sort-by type | reject num_links inode readonly
}
