function g --wraps "git"
    if count $argv > /dev/null
        git $argv
    else
        git status -sb
    end
end
