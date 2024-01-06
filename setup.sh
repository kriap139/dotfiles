#!/bin/bash

config_dir=$HOME/.config/chezmoi
config="$config_dir/chezmoi.toml"

mkdir -p $config_dir 
touch "$config"

echo -e "[keepassxc]\n\tdatabase='$1'" > "$config"

chezmoi init https://github.com/kriap139/dotfiles.git