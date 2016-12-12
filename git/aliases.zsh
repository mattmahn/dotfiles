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
alias gcl='git clone'
alias gd='git diff'
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gpr='gp && git pr'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}

gitall() {
  find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} "$@" \;
}
