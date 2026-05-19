
################################################################################
################################ Bootstrap Zinit ###############################
################################################################################

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

################################################################################
################################# Zinit Config #################################
################################################################################

# ====================== Early Config ======================

zinit ice as"completion"
zinit light "$HOME/.zfunc"

zinit snippet OMZL::history.zsh
zinit snippet "$HOME/.zsh_user/alias.zsh"
zinit snippet "$HOME/.zsh_user/opts.zsh"

# ======================= Oh My ZSH ========================

zinit wait lucid for \
        OMZL::git.zsh \
        OMZL::clipboard.zsh \
        OMZL::functions.zsh \
        OMZL::termsupport.zsh \
        OMZL::key-bindings.zsh \
        OMZL::directories.zsh \
        OMZP::git \
        OMZP::fzf \
        OMZP::dotenv \
        OMZP::man \
        OMZP::sudo \
        is-snippet "$HOME/.zsh_user/pipenv.zsh"


# ==================== Starship Prompt =====================

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship



# ===================== Custom Config ======================

zinit wait lucid for \
    is-snippet "$HOME/.zsh_user/tmux.zsh" \
    is-snippet "$HOME/.zsh_user/conf_files.zsh" \
    is-snippet "$HOME/.zsh_user/lf.zsh" \
    is-snippet "$HOME/.zsh_user/exa.zsh" \
    is-snippet "$HOME/.zsh_user/nvm.zsh" \
    is-snippet "$HOME/.zsh_user/pnpm.zsh" \
    is-snippet "$HOME/.zsh_user/pyenv.zsh" \
    is-snippet "$HOME/.zsh_user/yadm.zsh"

# ====================== Core Plugins ======================

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" reset-prompt \
      zdharma-continuum/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .; rm **/_pipenv' \
      zsh-users/zsh-completions


# ===================== Other Plugins ======================

zinit wait lucid light-mode for \
    MichaelAquilina/zsh-you-should-use
