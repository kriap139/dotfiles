# source /etc/profile with bash
if status is-login
    if not set -q __sourced_profile
        set -x __sourced_profile 1
        exec bash -c "\
            test -e /etc/profile && source /etc/profile     
            export $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator | sed '/:$/d; /^$/d' | xargs)
            exec fish --login
        "
    end
    fish_add_path $HOME/.local/bin
    set -e __sourced_profile
end

if status is-interactive
    alias cd-arch-build='cd /home/makepkg/pkg-manual'

    # Cosmic terminal beam cursor
    echo -n -e "\e[5 q"

    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end
