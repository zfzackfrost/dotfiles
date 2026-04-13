function yadm_main_branch() {
  command yadm rev-parse --git-dir &>/dev/null || return
  
  local remote ref
  
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command yadm show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done
  
  # Fallback: try to get the default branch from remote HEAD symbolic refs
  for remote in origin upstream; do
    ref=$(command yadm rev-parse --abbrev-ref $remote/HEAD 2>/dev/null)
    if [[ $ref == $remote/* ]]; then
      echo ${ref#"$remote/"}; return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

function yadm_develop_branch() {
  command yadm rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command yadm show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo develop
  return 1
}


alias yrt='cd "$(yadm rev-parse --show-toplevel \|\| echo .)"'
alias ygpush='yadm push origin "$(git_current_branch)"'
alias ygp='yadm push origin $(current_branch)'
alias ygl='yadm pull origin $(current_branch)'
alias ygpnp='ygl && ygp'
alias ygpur='ygu'
alias y='yadm'
alias ya='yadm add'
alias yaa='yadm add --all'
alias yapa='yadm add --patch'
alias yau='yadm add --update'
alias yav='yadm add --verbose'
alias ywip='yadm add -A; yadm rm $(yadm ls-files --deleted) 2> /dev/null; yadm commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias yam='yadm am'
alias yama='yadm am --abort'
alias yamc='yadm am --continue'
alias yamscp='yadm am --show-current-patch'
alias yams='yadm am --skip'
alias yap='yadm apply'
alias yapt='yadm apply --3way'
alias ybs='yadm bisect'
alias ybsb='yadm bisect bad'
alias ybsg='yadm bisect good'
alias ybsn='yadm bisect new'
alias ybso='yadm bisect old'
alias ybsr='yadm bisect reset'
alias ybss='yadm bisect start'
alias ybl='yadm blame -w'
alias yb='yadm branch'
alias yba='yadm branch --all'
alias ybd='yadm branch --delete'
alias ybD='yadm branch --delete --force'
alias ybgd='LANG=C yadm branch --no-color -vv \| grep ": gone\]" \| cut -c 3- \| awk '"'"'{print $1}'"'"' \| xargs yadm branch -d'
alias ybgD='LANG=C yadm branch --no-color -vv \| grep ": gone\]" \| cut -c 3- \| awk '"'"'{print $1}'"'"' \| xargs yadm branch -D'
alias ybm='yadm branch --move'
alias ybnm='yadm branch --no-merged'
alias ybr='yadm branch --remote'
alias ygsup='yadm branch --set-upstream-to=origin/$(git_current_branch)'
alias ybg='LANG=C yadm branch -vv \| grep ": gone\]"'
alias yco='yadm checkout'
alias ycor='yadm checkout --recurse-submodules'
alias ycb='yadm checkout -b'
alias ycB='yadm checkout -B'
alias ycd='yadm checkout $(yadm_develop_branch)'
alias ycm='yadm checkout $(yadm_main_branch)'
alias ycp='yadm cherry-pick'
alias ycpa='yadm cherry-pick --abort'
alias ycpc='yadm cherry-pick --continue'
alias yclean='yadm clean --interactive -d'
alias ycl='yadm clone --recurse-submodules'
alias yclf='yadm clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias yccd='yadm clone --recurse-submodules "$@" && cd "$(basename $\_ .yadm)"'
alias ycam='yadm commit --all --message'
alias ycas='yadm commit --all --signoff'
alias ycasm='yadm commit --all --signoff --message'
alias ycmsg='yadm commit --message'
alias ycsm='yadm commit --signoff --message'
alias yc='yadm commit --verbose'
alias yca='yadm commit --verbose --all'
alias yca!='yadm commit --verbose --all --amend'
alias ycan!='yadm commit --verbose --all --no-edit --amend'
alias ycans!='yadm commit --verbose --all --signoff --no-edit --amend'
alias ycann!='yadm commit --verbose --all --date=now --no-edit --amend'
alias yc!='yadm commit --verbose --amend'
alias ycn='yadm commit --verbose --no-edit'
alias ycn!='yadm commit --verbose --no-edit --amend'
alias ycs='yadm commit -S'
alias ycss='yadm commit -S -s'
alias ycssm='yadm commit -S -s -m'
alias ycf='yadm config --list'
alias ycfu='yadm commit --fixup'
alias ydct='yadm describe --tags $(yadm rev-list --tags --max-count=1)'
alias yd='yadm diff'
alias ydca='yadm diff --cached'
alias ydcw='yadm diff --cached --word-diff'
alias yds='yadm diff --staged'
alias ydw='yadm diff --word-diff'
alias ydv='yadm diff -w "$@" \| view -'
alias ydup='yadm diff @{upstream}'
alias ydnolock='yadm diff $@ ":(exclude)package-lock.json" ":(exclude)\*.lock"'
alias ydt='yadm diff-tree --no-commit-id --name-only -r'
alias yf='yadm fetch'
alias yfa='yadm fetch --all --tags --prune'
alias yfo='yadm fetch origin'
alias yg='yadm gui citool'
alias yga='yadm gui citool --amend'
alias yhh='yadm help'
alias ylgg='yadm log --graph'
alias ylgga='yadm log --graph --decorate --all'
alias ylgm='yadm log --graph --max-count=10'
alias ylod='yadm log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias ylods='yadm log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias ylol='yadm log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias ylola='yadm log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias ylols='yadm log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias ylo='yadm log --oneline --decorate'
alias ylog='yadm log --oneline --decorate --graph'
alias yloga='yadm log --oneline --decorate --graph --all'
alias ylp='yadm log --pretty=<format>'
alias ylg='yadm log --stat'
alias ylgp='yadm log --stat --patch'
alias yignored='yadm ls-files -v \| grep "^[[:lower:]]"'
alias yfg='yadm ls-files \| grep'
alias ym='yadm merge'
alias yma='yadm merge --abort'
alias ymc='yadm merge --continue'
alias yms='yadm merge --squash'
alias ymff='yadm merge --ff-only'
alias ymom='yadm merge origin/$(yadm_main_branch)'
alias ymum='yadm merge upstream/$(yadm_main_branch)'
alias ymtl='yadm mergetool --no-prompt'
alias ymtlvim='yadm mergetool --no-prompt --tool=vimdiff'
alias yl='yadm pull'
alias ypr='yadm pull --rebase'
alias yprv='yadm pull --rebase -v'
alias ypra='yadm pull --rebase --autostash'
alias yprav='yadm pull --rebase --autostash -v'
alias yprom='yadm pull --rebase origin $(yadm_main_branch)'
alias ypromi='yadm pull --rebase=interactive origin $(yadm_main_branch)'
alias yprum='yadm pull --rebase upstream $(yadm_main_branch)'
alias yprumi='yadm pull --rebase=interactive upstream $(yadm_main_branch)'
alias ygpull='yadm pull origin "$(git_current_branch)"'
alias yluc='yadm pull upstream $(git_current_branch)'
alias ylum='yadm pull upstream $(yadm_main_branch)'
alias yp='yadm push'
alias ypd='yadm push --dry-run'
alias ypf!='yadm push --force'
alias ygf='yadm push --force origin $(current_branch)'
alias ypf='yadm push --force-with-lease --force-if-includes'
alias ygfl='yadm push --force-with-lease origin $(current_branch)'
alias ypsup='yadm push --set-upstream origin $(git_current_branch)'
alias ypsupf='yadm push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'
alias ypv='yadm push --verbose'
alias ypoat='yadm push origin --all && yadm push origin --tags'
alias ypod='yadm push origin --delete'
alias ypu='yadm push upstream'
alias yrb='yadm rebase'
alias yrba='yadm rebase --abort'
alias yrbc='yadm rebase --continue'
alias yrbi='yadm rebase --interactive'
alias yrbo='yadm rebase --onto'
alias yrbs='yadm rebase --skip'
alias yrbd='yadm rebase $(yadm_develop_branch)'
alias yrbm='yadm rebase $(yadm_main_branch)'
alias yrbom='yadm rebase origin/$(yadm_main_branch)'
alias yrbum='yadm rebase upstream/$(yadm_main_branch)'
alias yrf='yadm reflog'
alias yr='yadm remote'
alias yrv='yadm remote --verbose'
alias yra='yadm remote add'
alias yrrm='yadm remote remove'
alias yrmv='yadm remote rename'
alias yrset='yadm remote set-url'
alias yrup='yadm remote update'
alias yrh='yadm reset'
alias yru='yadm reset --'
alias yrhh='yadm reset --hard'
alias yrhk='yadm reset --keep'
alias yrhs='yadm reset --soft'
alias ypristine='yadm reset --hard && yadm clean --force -dfx'
alias ywipe='yadm reset --hard && yadm clean --force -df'
alias yroh='yadm reset origin/$(git_current_branch) --hard'
alias yrs='yadm restore'
alias yrss='yadm restore --source'
alias yrst='yadm restore --staged'
alias yunwip='yadm rev-list --max-count=1 --format="%s" HEAD \| grep -q "--wip--" && yadm reset HEAD~1'
alias yrev='yadm revert'
alias yrm='yadm rm'
alias yrmc='yadm rm --cached'
alias ycount='yadm shortlog --summary -n'
alias ysh='yadm show'
alias ysps='yadm show --pretty=short --show-signature'
alias ystall='yadm stash --all'
alias ystu='yadm stash --include-untracked'
alias ystaa='yadm stash apply'
alias ystc='yadm stash clear'
alias ystd='yadm stash drop'
alias ystl='yadm stash list'
alias ystp='yadm stash pop'
alias ysta='yadm stash push'
alias ysts='yadm stash show --patch'
alias yst='yadm status'
alias yss='yadm status --short'
alias ysb='yadm status --short -b'
alias ysi='yadm submodule init'
alias ysu='yadm submodule update'
alias ysd='yadm svn dcommit'
alias yit-svn-dcommit-push='yadm svn dcommit && yadm push github $(yadm_main_branch):svntrunk'
alias ysr='yadm svn rebase'
alias ysw='yadm switch'
alias yswc='yadm switch -c'
alias yswd='yadm switch $(yadm_develop_branch)'
alias yswm='yadm switch $(yadm_main_branch)'
alias yta='yadm tag --annotate'
alias yts='yadm tag -s'
alias ytv='yadm tag \| sort -V'
alias yignore='yadm update-index --assume-unchanged'
alias yunignore='yadm update-index --no-assume-unchanged'
alias ywch='yadm log --patch --abbrev-commit --pretty=medium --raw'
alias ywt='yadm worktree'
alias ywtls='yadm worktree list'
alias ywtmv='yadm worktree move'
alias ywtrm='yadm worktree remove'
ytl(){ yadm tag --sort=-v:refname -n --list ${1}\* }; noglob gtl

function ygu() {
  local b
  [[ $# != 1 ]] && b="$(git_current_branch)"
  yadm pull --rebase origin "${b:-$1}"
}
compdef _git ggu=git-pull


function ygl() {
  if [[ $# != 0 ]] && [[ $# != 1 ]]; then
    git pull origin "${*}"
  else
    local b
    [[ $# == 0 ]] && b="$(git_current_branch)"
    git pull origin "${b:-$1}"
  fi
}
compdef _git ygl=git-pull
