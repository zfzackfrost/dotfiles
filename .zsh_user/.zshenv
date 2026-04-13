typeset -Tx PYTHONPATH pythonpath ':'

. "$HOME/.cargo/env"

path+=("$HOME/.local/bin/")
path+=("$HOME/.scripts/")

source "$HOME/.zsh_user/dirs.zsh"
source "$HOME/.zsh_user/blender.zsh"
source "$HOME/.zsh_user/custom_command.zsh"
