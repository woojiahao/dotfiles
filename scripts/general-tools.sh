#!/bin/bash

alias c="clear"

# Detailed ls command
alias ls="ls -A --color"

# Syncs .zshrc to reload the utility scripts available
alias sync="source ~/.zshrc"

# Clears contents of a folder
alias clear-folder="rm -rf ./*"

# Exports a markdown file to pdf using pandoc
function convert {
  TARGET=$([[ -z "$1" ]] && echo 'README.md' || echo "$1")
  DESTINATION=$([[ -z "$2" ]] && echo 'README.pdf' || echo "$2")

  echo "Exporting $TARGET to $DESTINATION"

  if [[ ! -f "float-adjustment.tex" ]]; then
    echo '\\usepackage{float}' >float-adjustment.tex
    echo '\\floatplacement{figure}{H}' >>float-adjustment.tex
  fi

  pandoc $TARGET --toc -V linkcolor:blue -H float-adjustment.tex -o $DESTINATION

  rm float-adjustment.tex
}

# Use pandoc to convert all Markdown files in a folder to org files
function md-to-org {
  for f in ./*.md; do
    local name=$(basename $f .md)
    pandoc -f markdown -t org -o $name.org ${f}
  done
}

# Create a new directory and cd into it
function mkcd {
  mkdir $1
  cd $1
}

# Sync all dotfiles
function dsync {
  [ -f "$HOME/.zshrc" ] && cp ~/.zshrc ~/dotfiles/.zshrc
  [ -f "$HOME/.ideavimrc" ] && cp ~/.ideavimrc ~/dotfiles/.ideavimrc
  [ -f "$HOME/.vimrc" ] && cp ~/.vimrc ~/dotfiles/.vimrc
  [ -f "$HOME/.wezterm.lua" ] && cp ~/.wezterm.lua ~/dotfiles/.wezterm.lua

  mkdir -p ~/dotfiles/.config/{nvim,zellij}
  [ -d "$HOME/.config/nvim" ] && cp -r ~/.config/nvim ~/dotfiles/.config/nvim
  [ -d "$HOME/.config/zellij" ] && cp -r ~/.config/zellij ~/dotfiles/.config/zellij
}
