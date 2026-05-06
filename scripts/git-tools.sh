#!/bin/bash

# Display detailed version of git log
alias log="git log --oneline --graph --all"

# Clone repository to ~/dev/<user>/<repo>
clone() {
  protocol=$1
  user=$2
  repo=$3

  mkdir -p "$HOME/dev/$user"

  if [ "$protocol" = "https" ]; then
    git clone "https://github.com/$user/$repo.git" "$HOME/dev/$user/$repo"
  else
    git clone "git@github.com:$user/$repo.git" "$HOME/dev/$user/$repo"
  fi
}
