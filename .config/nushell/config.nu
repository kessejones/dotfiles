use modules/theme.nu
use modules/keybindings.nu
use modules/completer.nu
use modules/menus.nu

$env.config = {
  show_banner: false

  ls: {
    use_ls_colors: true
    clickable_links: false
  }

  rm: {
    always_trash: false
  }

  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: auto
    show_empty: true
    padding: { left: 1, right: 1 } # a left right padding of each column in a table
    trim: {
        methodology: wrapping # wrapping or truncating
        wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
        truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
    header_on_separator: false # show header text on separator/border line
    # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
  }

  error_style: "fancy"

  # datetime_format determines what a datetime rendered in the shell would look like.
  # Behavior without this configuration point will be to "humanize" the datetime display,
  # showing something like "a day ago."
  datetime_format: {
    # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
    # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
  }

  explore: {
    status_bar_background: {fg: "#1D1F21", bg: "#C4C9C6"},
    command_bar_text: {fg: "#C4C9C6"},
    highlight: {fg: "black", bg: "yellow"},
    status: {
      error: {fg: "white", bg: "red"},
      warn: {}
      info: {}
    },
    table: {
      split_line: {fg: "#404040"},
      selected_cell: {bg: light_blue},
      selected_row: {
        bg: light_green
      },
      selected_column: {},
    },
  }

  history: {
    max_size: 100_000 # Session has to be reloaded for this to take effect
    sync_on_enter: true
    file_format: "plaintext" # "sqlite" or "plaintext"
    isolation: false 
  }

  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
      enable: true
      max_results: 100
      completer: {|spans| (completer $spans) }
    }
    use_ls_colors: true
  }

  filesize: {
    metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
  }

  cursor_shape: {
    emacs: line
    vi_insert: line
    vi_normal: block
  }

  color_config: (theme)
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  buffer_editor: "nvim"
  use_ansi_coloring: true
  bracketed_paste: true
  edit_mode: vi
  render_right_prompt_on_last_line: false
  use_kitty_protocol: false
  highlight_resolved_externals: true

  shell_integration: {
    osc2: true
    osc7: true
    osc8: true
    osc9_9: true
    osc133: true
    osc633: true
    reset_application_mode: true
  }

  plugins: {}

  hooks: {
    pre_prompt: [{ || 
      if (which direnv | is-empty) {
        return
      }
      direnv export json | from json | default {} | load-env
    }]
    pre_execution: [{ null }]
    env_change: {
      PWD: [{|before, after| null }]
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }"
    command_not_found: { null }
  }

  menus: (menus)
  keybindings: (keybindings)
}

source commands/git.nu
source commands/docker.nu
source modules/alias.nu
source modules/zoxide.nu

# load local config if exists
source (if ("~/.user.nu" | path expand | path exists) {
  "~/.user.nu"
} else {
  "/dev/null"
})
