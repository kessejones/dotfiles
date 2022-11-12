function kbl
    set -l id (gum spin --title="Loading pods" --show-output kubectl get pods | awk 'NR>1' | gum choose --height 20 --limit 1 | cut -d' ' -f1)

    if test -n "$id"
        kubectl logs -f $id
    end
end
