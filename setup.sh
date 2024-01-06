#!/bin/bash

data_dir="$HOME/.local/share/chezmoi"
setup_gen="$data_dir/setup_gen.toml"
config_dir="/home/$USER/.config/chezmoi"
config="$config_dir/chezmoi.toml"

rm -r "$config_dir" 2> /dev/null
mkdir -p $config_dir

touch "$setup_gen"
touch "$config"
echo -e "[keepassxc]\n\tdatabase='$1'" > "$setup_gen"
echo -e "[keepassxc]\n\tdatabase='$1'" > "$config"

if [ ! -d $data_dir ]; then 
    chezmoi init https://github.com/kriap139/dotfiles.git
    cd $data_dir
    git remote set-url origin git@github.com:kriap139/dotfiles.git
else
    chezmoi init --apply
fi

rm -f $setup_gen
