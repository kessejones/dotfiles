def __completer_docker_containers [] {
  (docker ps --format=json) | lines | each {
    |e| let item = ($e | from json | select ID Names)
    {
      value: $item.ID
      description: $item.Names
    }
  }
}

def __completer_docker_compose_containers [] {
  (docker compose ps --format=json) | lines | each {
    |e| let item = ($e | from json | select Names Image)
    {
      value: $item.Names
      description: $item.Image
    }
  }
}

def __command_docker_ps [] {
  (docker ps --format=json) | lines | each {|e| $e | from json | select ID Names Image Status Ports}
}

def __command_docker_compose_ps [] {
  (docker compose ps --format=json) | lines | each {|e| $e | from json | select ID Names Image Status Ports}
}

# Alias for docker ps
export def "d ll" [] {
  (__command_docker_ps) | table --index false
}

# Alias for docker compose ps
export def "dc ll" [] {
  (__command_docker_compose_ps) | table --index false
}

# Docker exec with autocomplete
export extern "docker exec -it" [
    container?: string@__completer_docker_containers
]

# Docker compose exec with autocomplete
export def "dc exec" [container?: string@__completer_docker_compose_containers, ...rest:string ] {
  docker compose exec $container ...$rest
}

# Alias for docker compose up -d
export def "dc upd" [] {
  docker compose up -d
}
