#!/bin/bash

sudo mkdir -p /nix && sudo chown $USER /nix
curl -L https://nixos.org/nix/install | bash
