#let zoxide_completer = {|spans|
#    #$spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
#    $spans | skip 1 | zoxide query -l ...$in | lines
#}

#def __completer_zoxide [query: string] {
#  (zoxide query -l $query | lines)
#}
#
#export def zi [query: string@__completer_zoxide] {
#  echo $query
#}
