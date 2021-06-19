#!/usr/bin/zsh

## Pressing . when .. will change it to ../../
function rationalise-dot() {
	if [[ $LBUFFER = *.(.|./) ]]; then
		[[ $LBUFFER[-1] = . ]] && LBUFFER+=/
		LBUFFER+=../
	else
		LBUFFER+=.
	fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

function normal-dot() {
	LBUFFER+=.
}
zle -N normal-dot
bindkey '^[.' normal-dot # alt-. inserts normal dot

## alias space to zoxide
function alias-space-zoxide() {
	if [ "$BUFFER" = "" ]; then
		LBUFFER="z "
	else
		LBUFFER+=" "
	fi
}
zle -N alias-space-zoxide
bindkey ' ' alias-space-zoxide
