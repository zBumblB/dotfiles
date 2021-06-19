export PATH="$PATH:${$(find -L ~/.local/bin -type d -printf %p:)%%:}"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export SVDIR=~/.local/service

export WALLPAPER="$XDG_DATA_HOME/wallpaper"
export PROJECTS="$HOME/Documents/projects"

# Color man pages
export LESS_TERMCAP_mb=$'\E[1;48;2;0;0;0m' # don't know
export LESS_TERMCAP_md=$'\E[1;38;2;251;73;52;1m' # title, command
export LESS_TERMCAP_me=$'\E[0;38;2;251;241;199m' # notable stuff
export LESS_TERMCAP_se=$'\E[0m' # don't know. Don't touch it tho
export LESS_TERMCAP_so=$'\E[1;38;2;211;134;155;48;2;50;48;47m' # statusbar and search
export LESS_TERMCAP_ue=$'\E[0m' # also don't touch
export LESS_TERMCAP_us=$'\E[1;38;2;184;187;38m' # key words like options, commands...
export LESS=-R



[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && exec startx "$XINITRC" -- -ardelay 250 -arinterval 30
