autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

setopt promptsubst
setopt hist_ignore_all_dups
export VISUAL="nvim"
export EDITOR="$VISUAL"
export LANG="en_US.UTF-8"
export KEYTIMEOUT="100" # One second delay for keybindings

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
