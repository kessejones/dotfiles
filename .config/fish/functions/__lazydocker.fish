function __lazydocker --description "Run lazydocker with docker or podman"
    docker ps > /dev/null 2>&1

    if test $status -eq 0
        lazydocker
    else
        podman ps > /dev/null 2>&1
        if test $status -eq 0
            # macos only
            DOCKER_HOST=unix://$HOME/.local/share/containers/podman/machine/qemu/podman.sock lazydocker
        else
            echo "Docker/Podman is not running"
        end
    end
end
