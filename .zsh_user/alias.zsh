# ============================================================
# ========================= Redirects ========================
# ============================================================

alias nvim="$USER_APPS_DIR/nvim.appimage"

# ============================================================
# ========================= Shortcuts ========================
# ============================================================

# --------------- Arch --------------
alias sysclean='yay -Yc && sudo pacman -Scc'

# --------------- ZSH ---------------
alias zg='zgenom'
alias zgr='zgenom reset'
alias resh='clear; exec zsh'
alias zgresh='zgenom reset; clear; exec zsh'

# --------------- Pnpm --------------
alias pn='pnpm'
alias pnx='pnpm dlx'
alias pnr='pnpm run'
alias pnc='pnpm create'
alias pna='pnpm add'
alias pnu='pnpm remove'

# --------------- Git ---------------
alias gsa='git submodule add'

# -------------- C/C++ --------------
alias make='make -j $(nproc)'
alias cmake='cmake $PROJECT_CMAKE_ARGS'
