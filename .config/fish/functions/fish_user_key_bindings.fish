function fish_user_key_bindings
    bind --erase -- \ct
    bind --erase --mode insert -- \ct

    bind --user -M insert \cy complete
    bind --user -M insert \cf accept-autosuggestion

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search
    bind --user -M insert \cp "prevd; commandline -f repaint"
    bind --user -M insert \cn "nextd; commandline -f repaint"

    bind --user -M insert \ce edit_command_buffer

    bind --user -M default gl end-of-line
    bind --user -M default gh beginning-of-line

    bind --user -M insert \co '$EDITOR'

    bind --user -M insert \cg '__change_git_directory; commandline -f repaint'

    set -g fish_key_bindings fish_vi_key_bindings
end
