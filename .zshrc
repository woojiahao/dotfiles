export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf,bg=#5c6370"

for file in ~/dotfiles/scripts/*; do
  source $file
done

export HOMEBREW_PATH=/opt/homebrew
export EDITOR='nvim'

export PATH=$PATH:$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:"$HOMEBREW_PATH/Cellar/postgresql@15/15.5_3/bin"
export PATH=$PATH:"$FLYCTL_INSTALL/bin"
export PATH=$PATH:"$HOMEBREW_PATH/opt/qt@5/bin"
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PATH

PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL_MM_OPT

export CPATH=$HOMEBREW_PATH/include
export LIBRARY_PATH=$HOMEBREW_PATH/lib

export DOTNET_ROOT=$HOME/dotnet
export FLYCTL_INSTALL="$HOME/.fly"

export LDFLAGS="${LDFLAGS} -L$HOMEBREW_PATH/opt/icu4c/lib"
export CPPFLAGS="${CPPFLAGS} -I$HOMEBREW_PATH/opt/icu4c/include"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export LDFLAGS="${LDFLAGS} -L$HOMEBREW_PATH/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I$HOMEBREW_PATH/zlib/lib/include"
export PKG_CONFIG_PATH=$HOMEBREW_PATH/opt/icu4c/lib/pkgconfig:"$PKG_CONFIG_PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

alias python="python3"
alias vim="nvim"
alias gmy="gitmastery"
alias lg='lazygit'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
eval "$(jenv init -)"
eval "$(/Users/woojiahao/.local/bin/mise activate zsh)"
source <(fzf --zsh)

if [[ -z "$ZELLIJ" ]] &&
  [[ "$TERM_PROGRAM" != "vscode" ]] &&
  [[ "$TERM_PROGRAM" != "zed" ]] &&
  [[ -z "$JETBRAINS_INTELLIJ_ZSH_DIR" ]] &&
  [[ -z "$JETBRAINS_IDE" ]]; then

  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    zellij attach -c
  else
    zellij
  fi

  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit
  fi
fi

fortune | cowsay -f stegosaurus

# Numeric development environment configuration
# Added by Numeric onboarding script on 2026-01-08
if [ -f "/Users/woojiahao/.numeric/.numericrc" ]; then
  source "/Users/woojiahao/.numeric/.numericrc"
fi
