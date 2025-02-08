function la --wraps "nu -c ls"
    nu -c "ls -a $argv | sort-by type | table --index false"
end
