export ZSH="/home/chill/.oh-my-zsh"

ZSH_THEME="lambda-mod"

plugins=(
  git 
  zsh-z 
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  heroku
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export LINUX_HOME=~/dotfiles
export LINUX_SCRIPT=$LINUX_HOME/scripts
export LINUX_EXPECT=$LINUX_SCRIPT/expect
export SNIPPETS=~/snippets

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf,bg=#5c6370"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Load the ~/.backup-list file if not present
if [[ ! -e ~/.backup-list ]]; then
  touch ~/.backup-list
fi

# Run all ~/linux/scripts scripts to be in shell scope
for file in $LINUX_SCRIPT/*; do
  source $file
done
