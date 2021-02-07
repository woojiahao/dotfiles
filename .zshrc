# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/chill/.oh-my-zsh"

ZSH_THEME="lambda-mod"

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
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# User configuration
export EDITOR='vim'
export EMACS='t'
export LINUX_HOME=~/dotfiles
export LINUX_SCRIPT=$LINUX_HOME/scripts
export LINUX_EXPECT=$LINUX_SCRIPT/expect
export SNIPPETS=~/snippets
export PATH="$PATH:$HOME/go/bin"
export BROWSER=/usr/bin/google-chrome-stable
# export GOTOOLDIR=$(go env GOTOOLDIR)
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$PATH:$GOTOOLDIR

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf,bg=#5c6370"

# Load pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

source /usr/share/nvm/init-nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chill/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chill/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chill/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chill/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"
export EMACS="emacs"
