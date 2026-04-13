setopt promptsubst

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit wait lucid for \
        OMZL::git.zsh \
        OMZL::clipboard.zsh \
        OMZL::functions.zsh \
        OMZL::history.zsh \
        OMZL::termsupport.zsh \
        OMZL::key-bindings.zsh \
        OMZL::directories.zsh \
        OMZP::git \
        OMZP::pipenv \
        OMZP::fzf \
        OMZP::dotenv \
        OMZP::man \
        OMZP::sudo

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit snippet "$HOME/.zsh_user/opts.zsh"
zinit wait lucid for \
    is-snippet "$HOME/.zsh_user/alias.zsh" \
    is-snippet "$HOME/.zsh_user/tmux.zsh" \
    is-snippet "$HOME/.zsh_user/conf_files.zsh" \
    is-snippet "$HOME/.zsh_user/lf.zsh" \
    is-snippet "$HOME/.zsh_user/exa.zsh" \
    is-snippet "$HOME/.zsh_user/nvm.zsh" \
    is-snippet "$HOME/.zsh_user/pnpm.zsh" \
    is-snippet "$HOME/.zsh_user/pyenv.zsh" \
    is-snippet "$HOME/.zsh_user/yadm.zsh" \
    is-snippet "$HOME/.zsh_user/blender.zsh" \

