typeset -ag exa_params
exa_params=(
  '--git' '--icons' '--classify' '--group'
  '--group-directories-first' '--time-style=iso'
)

alias ls='exa -1 $exa_params'
alias l='exa -1 --git-ignore $exa_params'
alias ll='exa --all --header --long $exa_params'
alias llm='exa --all --header --long --sort=modified $exa_params'
alias la='exa -lbhHigUmuSa'
alias lx='exa -lbhHigUmuSa@'
alias lt='exa --tree $exa_params'
alias tree='exa --tree $exa_params'
