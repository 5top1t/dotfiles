#!/bin/bash
alias vim="nvim"

# Python
# -----------------------------
# Updates the python and pip aliases when using virtualenv 
alias python='eval $(which python3)'
alias pip='eval $(which pip3)'
alias activate='source ./venv/bin/activate'

# Git Commands
# -----------------------------
# git add -u : updates existing files that are tracked and does not add new ones
alias gat="ga -u"

# Delete a local branch
function gbdl() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}
    
  gcm
  gb -D "${branch_name}"
}

# Delete a remote branch
function gbdr() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}

  gcm
  gp origin --delete "${branch_name}"
}

# Delete a local and remote branch
function gbdrl() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}

  gcm
  gp origin --delete "${branch_name}"
  gb -D "${branch_name}"
}

