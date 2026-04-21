# ============================================================
# ========================= Redirects ========================
# ============================================================

alias nvim="$USER_APPS_DIR/nvim.appimage"

# ============================================================
# ========================= Shortcuts ========================
# ============================================================

# -------------- Misc ---------------
alias fdh='fd --no-ignore --hidden'

# --------------- ZSH ---------------
alias ziu='zinit update'
alias resh='clear; exec zsh'

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
