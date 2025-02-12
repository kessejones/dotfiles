if type -q zoxide
    zoxide init fish | source
else
    echo "zoxide is not installed"
end
