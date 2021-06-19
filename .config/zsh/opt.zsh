#!/usr/bin/zsh

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt correct # Auto correct mistakes

setopt rcexpandparam # Array expension with parameters

setopt nobeep # don't beep on error

setopt autocd # if command can't be executed and is a directory, cd

setopt interactivecomments # recognize comments

## History
setopt appendhistory # append history instead of overwriting

setopt histignorealldups # remove duplicate commands
