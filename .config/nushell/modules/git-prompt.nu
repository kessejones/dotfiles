def git_branch [] {
  do -i { (git rev-parse --abbrev-ref HEAD) | complete | get stdout | str trim }
}

def in_git_repo [] { 
  (git_branch | is-empty) == false
}

export def main [] {
  let currently_in_git_repo = in_git_repo

  if not $currently_in_git_repo {
      return ""
  }

  let branch_info = (git_branch)
  let git_status = git status -s

  let git_status = $git_status
    | lines
    | str replace -r '(.* ).*' '$1'
    | sort
    | uniq -c
    | insert type {
      |e| if ($e.value | str contains "M") {
          "blue_bold"
        } else if ($e.value | str contains "??") {
          "yellow_bold"
        } else if ($e.value | str contains "D") {
          "red_bold"
        } else if ($e.value | str contains "A") {
          "cyan_bold"
        } else ""
      }
    | each {
        |e| $"($e.count)($e.value | str trim)"
      }
    | reduce --fold '' {|str all| $"($all),($str)" }
    | str substring 1..

  let final_git_status = if $git_status == "" {
    ""
  } else {
    $" ($git_status)"
  }

# construct the prompt
$"($branch_info)($final_git_status)"
}
