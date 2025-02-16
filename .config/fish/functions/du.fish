function du --wraps "du"
    nu -c "du $argv | table --index=false"
end
