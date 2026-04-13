export MY_KITTY_CONF="$HOME/.config/kitty/kitty.conf"
export MY_LFRC="$HOME/.config/lf/lfrc"
export MY_NVIM_INIT="$HOME/.config/nvim/init.lua"
export MY_STARSHIP_TOML="$HOME/.config/starship.toml"
export MY_TMUXP_WORKSPACE="$HOME/.tmuxp/workspace.yaml"
export MY_TMUX_CONF="$HOME/.tmux.conf"
export MY_ZSHRC="$HOME/.zsh_user/.zshrc"
export MY_CLAUDEMD="$HOME/.claude/CLAUDE.md"

alias confkitty='swork confkitty $(dirname $MY_KITTY_CONF) $MY_KITTY_CONF'
alias conflf='swork conflf $(dirname $MY_LFRC) $MY_LFRC'
alias confnvim='swork confnvim $(dirname $MY_NVIM_INIT)'
alias confstarship='swork confstarship $(dirname $MY_STARSHIP_TOML) $MY_STARSHIP_TOML'
alias conftmux='swork conftmux $(dirname $MY_TMUX_CONF) $MY_TMUX_CONF'
alias confwork='swork confwork $(dirname $MY_TMUXP_WORKSPACE) $MY_TMUXP_WORKSPACE'
alias confzsh='swork confzsh $(dirname $MY_ZSHRC) $MY_ZSHRC'
alias confclaude='swork confclaude $(dirname $MY_CLAUDEMD) $MY_CLAUDEMD'

