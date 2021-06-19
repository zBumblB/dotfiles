#!/usr/bin/zsh

bindkey -v
export KEYTIMEOUT=1

## change cursor shape when changing vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

## use beam cursor on startup
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init
