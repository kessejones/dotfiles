function __lazydocker --description "Run lazydocker with docker or podman"
    docker ps > /dev/null 2>&1

    if test $status -eq 0
        lazydocker
    else
        podman ps > /dev/null 2>&1

        if test $status -eq 0
            set -l qemu_sock "$HOME/.local/share/containers/podman/machine/qemu/podman.sock"
            set -l applehv_sock (podman machine inspect | jq --raw-output '.[0] | .ConnectionInfo.PodmanSocket.Path')
            # macos only
            if test -e $qemu_sock
                DOCKER_HOST=unix://$qemu_sock lazydocker
            else if test -e $applehv_sock
                DOCKER_HOST=unix://$applehv_sock lazydocker
            end
        else
            echo "Docker/Podman is not running"
        end
    end
end
