#!/bin/zsh
antibody bundle miekg/lean

# these two guys **MUST** be load last.
antibody bundle <<EOF
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOF
