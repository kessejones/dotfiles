function _fzf_search_history --description "Search command history. Replace the command line with the selected command."
    # history merge incorporates history changes from other fish sessions
    builtin history merge

    set command_with_ts (
        # Reference https://devhints.io/strftime to understand strftime format symbols
        builtin history --null --show-time="%m-%d %H:%M:%S │ " |
        _fzf_wrapper --read0 \
            --tiebreak=index \
            --query=(commandline) \
            --header-first \
            --header 'Search in history' \
            # preview current command using fish_ident in a window at the bottom 3 lines tall
            # --preview="echo -- {4..} | fish_indent --ansi" \
            # --preview-window="bottom:3:wrap" \
            --bind "ctrl-space:execute(echo 'REPLACE │ {}')+abort,enter:execute(echo 'RUN │ {}')+abort" \
            $fzf_history_opts |
        string collect
    )

    if test $status -eq 0
        set selected_parts (string split --max 3 " │ " $command_with_ts)

        set command_selected $selected_parts[3]
        switch $selected_parts[1]
            case RUN
                eval $command_selected
            case REPLACE
                commandline --replace -- $command_selected
        end 
    end

    commandline --function repaint
end
