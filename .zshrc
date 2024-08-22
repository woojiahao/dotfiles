# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

export EDITOR='vim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#abb2bf,bg=#5c6370"

for file in ~/dotfiles/scripts/*; do
  source $file
done

# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# export PATH="$HOME/.jenv/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

eval "$(jenv init -)"

alias python="python3"
# alias vim="nvim"

comp() {
  javac -Xlint:rawtypes -Xlint:unchecked $1.java
  java $1
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


PATH="/Users/woojiahao/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/woojiahao/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/woojiahao/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/woojiahao/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/woojiahao/perl5"; export PERL_MM_OPT;

export PATH="/opt/homebrew/Cellar/postgresql@15/15.5_3/bin:$PATH"

export DOTNET_ROOT=$HOME/dotnet
export FLYCTL_INSTALL="/Users/woojiahao/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

eval "$(rbenv init - zsh)"

export PATH=$PATH:/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home/bin
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"

export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/icu4c/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/icu4c/include"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH=/opt/homebrew/opt/icu4c/lib/pkgconfig:"$PKG_CONFIG_PATH"

start_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/Users/woojiahao/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/Users/woojiahao/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/Users/woojiahao/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/Users/woojiahao/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}
# eval "$(atuin init zsh)"
