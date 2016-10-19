#!/bin/sh
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcb='git-copy-branch-name'
alias gco='git checkout'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gpr='gp && open-pr'
alias gs='git status -sb'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}

gitall() {
  find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} "$@" \;
}
