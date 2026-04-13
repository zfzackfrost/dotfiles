# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 3 days
zgenom autoupdate 3

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"
    
    zgenom compdef

    zgenom load "$HOME/.zsh_user/opts.zsh"
    zgenom load "$HOME/.zsh_user/alias.zsh"
    zgenom load "$HOME/.zsh_user/tmux.zsh"
    zgenom load "$HOME/.zsh_user/conf_files.zsh"
    zgenom load "$HOME/.zsh_user/lf.zsh"
    zgenom load "$HOME/.zsh_user/exa.zsh"
    zgenom load "$HOME/.zsh_user/nvm.zsh"
    zgenom load "$HOME/.zsh_user/pnpm.zsh"
    zgenom load "$HOME/.zsh_user/pyenv.zsh"
    zgenom load "$HOME/.zsh_user/yadm.zsh"
    zgenom load "$HOME/.zsh_user/blender.zsh"
    zgenom load "$HOME/.zsh_user/bash_complete/tio.sh"


    zgenom ohmyzsh
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/starship
    zgenom ohmyzsh plugins/pipenv
    zgenom ohmyzsh plugins/dotenv
    zgenom ohmyzsh plugins/fzf
    zgenom ohmyzsh plugins/tldr
    zgenom ohmyzsh plugins/man
    zgenom ohmyzsh plugins/sudo


    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-autosuggestions

    zgenom load "${HOME}/.zfunc"

    zgenom save
    zgenom compile "$HOME/.zshrc"
fi

