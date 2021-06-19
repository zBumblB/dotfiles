#!/usr/bin/zsh

### if tmux is executable, X is running, and not inside a tmux session, then attach.
if [ -n "${commands[tmux]}" ] && [ -n "${DISPLAY}" ]; then
  [ -z "${TMUX}" ] && exec tmux new -AsMain
fi

ZSH_DIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

function confsrc() {
	[ -f "$ZSH_DIR/$1" ] && . "$ZSH_DIR/$1"
}

## options
confsrc opt.zsh

## aliases
confsrc aliasrc

## completion
confsrc completion.zsh

## make changing directories faster
confsrc quickcd.zsh

## vi mode
confsrc vimode.zsh

unset -f confsrc
unset ZSH_DIR

## better cd
eval "$(zoxide init zsh)"

## prompt
eval "$(starship init zsh)"

## Plugins

## syntax highlighting. requires fast-syntax-highlighting (aur)
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

## history substring search. requires zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## fish-like autosuggestions. requires zsh-autosuggestions(-git optionally)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
