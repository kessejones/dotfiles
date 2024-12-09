function fish_user_key_bindings
    bind --erase -- \ct
    bind --erase --mode insert -- \ct

    bind --user -M insert \cy accept-autosuggestion
    bind --user -M insert \cf complete

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search

    bind --user -M default gl end-of-line
    bind --user -M default gh beginning-of-line

    bind --user -M insert \co '$EDITOR'

    set -g fish_key_bindings fish_vi_key_bindings
end
