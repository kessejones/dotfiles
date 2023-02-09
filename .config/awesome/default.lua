local default = {
    launcher = "rofi -show-icons -show drun",
    terminal = "kitty",
    secondary_terminal = "kitty -e " .. os.getenv("SHELL"),
    webbrowser = "firefox",
    secondary_webbrowser = "brave-browser",
    discord = "discord",
    filemanager = "nautilus",
}

return default
