function ls --wraps "nu -c ls"
    set args (string escape $argv)
    nu -c "ls $args | sort-by type | table --index false"
end
