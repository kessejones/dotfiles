local default = {
    launcher = "rofi -show-icons -show drun",
    terminal = "alacritty",
    secondary_terminal = "alacritty -e " .. os.getenv("SHELL"),
}

return default
