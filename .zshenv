# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.
#
# Do not modify this file unless you know exactly what you are doing.
# It is strongly recommended to keep all shell customization and configuration
# (including exported environment variables such as PATH) in ~/.zshrc or in
# files sourced from ~/.zshrc. If you are certain that you must export some
# environment variables in ~/.zshenv, do it where indicated by comments below.

if [ -n "${ZSH_VERSION-}" ]; then
  # If you are certain that you must export some environment variables
  # in ~/.zshenv (see comments at the top!), do it here:

    
  # Paths need to be exported here to use with sxhkd

  if [ -n "${XDG_SESSION_DESKTOP+1}" ]; then
    export PATH="$PATH:$HOME/scripts:$HOME/scripts/dmenu:$HOME/scripts/crontab:$HOME/.local/bin"
    # Export GUI env
    export TERMINAL="alacritty"
    export TERMINAL2="guake"
    export VIDEO="mpv"
    export IMAGE="sxiv"
    export READER="zathura"
    export DMENU="rofi -dmenu"
    export BROWSER="qutebrowser"
    export CM_LAUNCHER="rofi"
  else
    export PATH="$PATH:$HOME/scripts:$HOME/.local.bin"
  fi

  # Default programs
  export EDITOR="nvim"
  export VISUAL="$EDITOR"
  export PAGER="less -R"
  export OPENER="xdg-open"
  
  # LESS
  export LESS=-R
  export LESSHISTFILE="-"
  export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
  
  # Man pages with color
  export MANPAGER="less -R --use-color -Dd+r -Du+b"
  
  # Cleanup
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_MUSIC_DIR="$HOME/Nextcloud/Music"
  export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
  export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
  export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
  export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
  export PASSWORD_STORE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/pass"
  export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
  export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
  export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
  export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
  export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

  #
  # Do not change anything else in this file.

  : ${ZDOTDIR:=~/.config/zsh}
  setopt no_global_rcs
  [[ -o no_interactive && -z "${Z4H_BOOTSTRAPPING-}" ]] && return
  setopt no_rcs
  unset Z4H_BOOTSTRAPPING
fi

Z4H_URL="https://raw.githubusercontent.com/romkatv/zsh4humans/v5"
: "${Z4H:=${XDG_CACHE_HOME:-$HOME/.cache}/zsh4humans/v5}"

umask o-w

if [ ! -e "$Z4H"/z4h.zsh ]; then
  mkdir -p -- "$Z4H" || return
  >&2 printf '\033[33mz4h\033[0m: fetching \033[4mz4h.zsh\033[0m\n'
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL -- "$Z4H_URL"/z4h.zsh >"$Z4H"/z4h.zsh.$$ || return
  elif command -v wget >/dev/null 2>&1; then
    wget -O-   -- "$Z4H_URL"/z4h.zsh >"$Z4H"/z4h.zsh.$$ || return
  else
    >&2 printf '\033[33mz4h\033[0m: please install \033[32mcurl\033[0m or \033[32mwget\033[0m\n'
    return 1
  fi
  mv -- "$Z4H"/z4h.zsh.$$ "$Z4H"/z4h.zsh || return
fi

. "$Z4H"/z4h.zsh || return

setopt rcs
