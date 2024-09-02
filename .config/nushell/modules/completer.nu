export def main [spans] {
  let fish_completer = {|spans|
      fish --command $'complete "--do-complete=($spans | str join " ")"'
      | $"value(char tab)description(char newline)" + $in
      | from tsv --flexible --no-infer
  }

  let carapace_completer = {|spans: list<string>|
      carapace $spans.0 nushell ...$spans
      | from json
      | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
  }

  let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
  }

  let expanded_alias = scope aliases
  | where name == $spans.0
  | get -i 0.expansion

  let spans = if $expanded_alias != null {
      $spans
      | skip 1
      | prepend ($expanded_alias | split row ' ' | take 1)
  } else {
      $spans
  }

  match $spans.0 {
    nu => $fish_completer
    git => $fish_completer
    __zoxide_z | __zoxide_zi => $zoxide_completer
    _ => $carapace_completer
  } | do $in $spans
}
