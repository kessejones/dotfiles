# local scripts
fish_add_path ~/.local/bin

# GoLang path config
export GOPATH=$HOME/go
fish_add_path $GOPATH/bin

# Brew path
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
    case Linux
        fish_add_path /home/linuxbrew/.linuxbrew/bin
end
