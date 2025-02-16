function __dc_subcommand_ps
    if type -q nu
        nu -c "docker compose ps --format=json | lines | each {|e| $e | from json | select ID Names Image Status Ports} | table --index=false"
        return 0
    end

    return 1
end

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
        case 'ps'
             __dc_subcommand_ps
            if test $status -eq 0
                return
            end
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
