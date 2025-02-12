function ls --wraps "nu -c ls"
    nu -c "ls $argv | sort-by type | table --index false"
end
