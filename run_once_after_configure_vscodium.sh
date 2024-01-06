#!/bin/bash

source "$HOME/.bashrc"

vsc="/usr/bin/vscodium"
ext="zokugun.sync-settings"

if ! command -v -- "$vsc" > /dev/null 2>&1; then
    echo "Missing vscodium, installing!"
    paru -S --noconfirm --needed vscodium-bin
fi

$vsc --install-extension $ext