local default = {
    launcher = "rofi -show-icons -show drun",
    terminal = "alacritty",
    secondary_terminal = "alacritty -e " .. os.getenv("SHELL"),
    webbrowser = "firefox",
    secondary_webbrowser = "brave-browser",
    discord = "discord",
}

return default
