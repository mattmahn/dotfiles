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
alias gpr='gp && git pr'
alias gpf='gp --force-with-lease'
alias gpu='git push -u origin HEAD'
alias gs='git status -sb'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}
