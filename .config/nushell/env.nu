$env.STARSHIP_SHELL = "nu"

let base_color = "#1e1e2e"
let prompt_color = "#313244"

def create_left_prompt [] {
    let home =  $nu.home-path

    let dir = (
        if ($env.PWD == $home) {
            "~"
        } else {
            ($env.PWD | path basename)
        }
    )

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    # 
    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
    let color = ansi { bg: $prompt_color }
    $"($color) ($path_segment) "
    # starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] {
    ""
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {||
    let color_insert = ansi blue
    let color_reset = ansi { fg: $prompt_color, bg: $base_color }
    $"($color_insert)[I]($color_reset) "
}
$env.PROMPT_INDICATOR_VI_NORMAL = {||
    let color_normal = ansi red_bold
    let color_reset = ansi { fg: $prompt_color, bg: $base_color }
    $"($color_normal)[N]($color_reset) "
}
$env.PROMPT_MULTILINE_INDICATOR = {||
    let color_normal = ansi yellow
    let color_reset = ansi { fg: $prompt_color, bg: $base_color }
    $"($color_normal)[M]($color_reset) "
}

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    $nu.default-config-dir
    ($nu.default-config-dir | path join 'scripts')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
