export ZSH="/home/chill/.oh-my-zsh"

ZSH_THEME="oxide"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Modules
zmodload zsh/mapfile

# User configuration
export EDITOR='vim'
export LINUX_HOME=~/dotfiles
export LINUX_SCRIPT=$LINUX_HOME/scripts
export LINUX_EXPECT=$LINUX_SCRIPT/expect
export SNIPPETS=~/snippets

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Run all ~/linux/scripts scripts to be in shell scope
for file in $LINUX_SCRIPT/*; do
  source $file
done
