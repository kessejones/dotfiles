if type -q atuin
    atuin init fish --disable-up-arrow | source
else
    echo "atuin is not installed"
end
