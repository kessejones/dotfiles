def __completer_git_branches [] {
  let current_branch = (do -i { git rev-parse --abbrev-ref HEAD } | complete | get stdout | str trim)
  if ($current_branch | is-empty) {
    []
  } else {
    (git branch --all --format "%(refname:short)")
    | lines 
    | filter {|e| $e != $current_branch and $e != "HEAD" and $e != "origin" }
    | sort
  }
}

# alias for git merge
export def "g m" [ branch?: string@__completer_git_branches ] {
  if ($branch | is-empty) {
    echo "No branches to merge"
  } else {
    git merge $branch
  }
}

# alias for git switch
export def "g sw" [ branch?: string@__completer_git_branches ] {
  if ($branch | is-empty) {
    echo "No branches to switch to"
  } else {
    git switch $branch
  }
}

# alias for git rebase
export def "g r" [ branch?: string@__completer_git_branches ] {
  if ($branch | is-empty) {
    echo "No branches to rebase to"
  } else {
    git rebase $branch
  }
}
