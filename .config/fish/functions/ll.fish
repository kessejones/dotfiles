function ll --wraps "nu -c ls"
    nu -c "ls -l $argv | sort-by type | table --index false"
end
