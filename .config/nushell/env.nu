use modules/prompt.nu rounded
use modules/git-prompt.nu

let base_color = "#1e1e2e"
let prompt_color = "#313244"

let catppuccin_blue = "#89b4fa"
let catppuccin_base = "#1e1e2e"
let catppuccin_lavender = "#b4befe"
let catppuccin_mauve = "#cba6f7"

def create_left_prompt [] {
  let dir = (
    if ($env.PWD == $nu.home-path) {
      "~"
    } else {
      let basename = ($env.PWD | path basename)
      match ($basename) {
        "" => "/"
        _ => $basename
      }
    }
  )

  let path_segment = (rounded $dir $catppuccin_blue $catppuccin_base true)
  let git_prompt_value = (git-prompt)
  let git_segment = if (not ($git_prompt_value | is-empty)) {
    (rounded $git_prompt_value $catppuccin_mauve $catppuccin_base true)
  } else {
    ""
  }

  let $prompt_text = [
    $path_segment
    $git_segment
  ] | str join " " | str trim

  $"(ansi reset)($prompt_text)"
}

def create_right_prompt [] {
  ""
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

$env.PROMPT_INDICATOR = {|| "|> " }
$env.PROMPT_INDICATOR_VI_INSERT = {||
    $" "
}
$env.PROMPT_INDICATOR_VI_NORMAL = {||
    $"(ansi red_bold):"
}

$env.PROMPT_MULTILINE_INDICATOR = {||
    $"(ansi { fg: '#585b70' })  >>"
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
    ($nu.default-config-dir | path join 'modules')
    ($nu.default-config-dir | path join 'commands')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
    ($nu.default-config-dir | path join 'commands')
]

$env.EDITOR = "nvim"

