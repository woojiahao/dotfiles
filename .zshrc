# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(
  git
  gitignore
  zsh-z
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  heroku
  golang
  gatsby
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf,bg=#5c6370"

for file in ~/dotfiles/scripts/*; do
  source $file
done

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

alias python="python3"
