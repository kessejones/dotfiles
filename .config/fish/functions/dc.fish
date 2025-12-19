function __dc_subcommand_ps
    if type -q nu
        nu -c "docker compose ps --format=json | lines | each {|e| $e | from json | select ID Names Image Status Ports} | table --index=false"
        return 0
    end

    return 1
end

function __dc_subcommand_exec
    set -l containers (docker compose ps --format=json | jq -c -r '.Name')
    if test -z "$containers"
        return
    end
    gum choose $containers
end

function dc --wraps "docker-compose"
    set -l args $argv[1..]

    switch $args[1]
        case 'upd' 'u'
            set args 'up' '-d' $args[2..]
        case 'lf'
            set args 'logs' '-f' $args[2..]
        case 'll'
            set args 'logs' '-fn1' $args[2..]
        case 'bb'
            set args 'build' $args[2..]
        case 's'
            set args 'stop' $args[2..]
        case 'd'
            set args 'down' $args[2..]
        case 'ps'
             __dc_subcommand_ps
            if test $status -eq 0
                return
            end
        case 'ee'
            set -l container (__dc_subcommand_exec)
            if test -z "$container"
                return
            end
            set args 'exec' '-it' $container sh $args[2..]
    end

    docker compose $args
end
