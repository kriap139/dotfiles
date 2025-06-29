#!/bin/fish

if status is-login
    #if not set -q __sourced_profile
    #    set -x __sourced_profile 1
    #    exec bash -c "\
    #        test -e /etc/profile && source /etc/profile     
    #        exec fish --login
    #    "
    #end
    #set -e __sourced_profile

    fish_add_path $HOME/.local/bin

    set -x EDITOR /usr/bin/hx
    set -x XDG_DATA_HOME $HOME/.local/share
    set -x XDG_CACHE_HOME $HOME/.cache
    set -x XDG_CONFIG_HOME $HOME/.config
    set -x XDG_STATE_HOME $HOME/.local/state

    # Diable files
    set -x LESSHISTFILE -

    # Fixing Paths
    set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
    set -x GOPATH "$XDG_DATA_HOME/go"
    #set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
    set -x GTK_RC_FILES "$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
    set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
    set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
    set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
    set -x WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
    set -x _JAVA_AWT_WM_NONREPARENTING 1
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"
    set -x RUSTUP_HOME XDG_DATA_HOME/rustup
    set -x HISTFILE XDG_STATE_HOME/bash_history

    # Theming
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

if status is-interactive
    alias cd-arch-build='cd /home/makepkg/pkg-manual'
    alias ls="ls --group-directories-first -vr"

    # Cosmic terminal beam cursor
    #echo -n -e "\e[5 q"

    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end
