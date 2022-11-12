function kbx
    set -l id (gum spin --title="Loading pods" --show-output kubectl get pods | awk 'NR>1' | gum choose --limit 1 --height 20 | cut -d' ' -f1)

    if test -n "$id"
        set -l command "sh"
        if test -n "$argv"
            set command "$argv"
        end
        kubectl exec -it $id $command
    end
end
