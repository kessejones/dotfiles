function dc --wraps "docker-compose"
    set -l args $argv[1..]

    switch $args[1]
        case 'upd'
            set args 'up' '-d' $args[2..]
        case 'lf'
            set args 'logs' '-f' $args[2..]
        case 'll'
            set args 'logs' '-fn1' $args[2..]
        case 'bb'
            set args 'build' $args[2..]
        case 'ee'
            set -l containers (dc ps --format=json | jq -c -r '.[].Name')
            set -l container (gum choose $containers)
            if not test -n "$container"
                return
            end

            set args 'exec' '-it' $container sh $args[2..]
    end

    docker compose $args
end
