function ls --wraps "nu -c ls"
    if type -q nu
        set -l args

        for l in $argv
            set -a args (string escape "$l")
        end

        nu -c "ls $args | sort-by type | table --index false"
    else
        command ls $argv
    end
end
