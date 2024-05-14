#!/bin/sh
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcb='git-copy-branch-name'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gds='gd --staged'
alias gl='git pull --prune'
alias gld='gl && git delete-local-merged'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gpf='gp --force-with-lease'
alias gpr='gp && git pr'
alias gpu='git push -u origin HEAD'
alias grea='git rebase --abort'
alias grec='git rebase --continue'
alias gs='git status -sb'
alias gsw='git switch'

gi() {
  local res="$(curl -SsL "https://www.toptal.com/developers/gitignore/api/$*")"
  if [[ "$1" = 'list' ]]; then
    local items="$(echo "$res" | tr ',' $'\n' | fzf --multi)"
    curl -SsL "https://www.toptal.com/developers/gitignore/api/$(paste -sd, - <<<"$items")"
  else
    echo -n "$res"
  fi
}
