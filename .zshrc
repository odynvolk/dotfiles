# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

bindkey "[D" backward-word
bindkey "[C" forward-word

setopt noincappendhistory
setopt nosharehistory

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-z zsh-autosuggestions colored-man-pages)

DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
#export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
#export JAVA_HOME=$JAVA_8_HOME

export EXP_OSX_DOCKER=true

export PATH=$PATH:$JAVA_HOME/bin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:~/bin
#export PATH=$PATH:/opt/homebrew/bin/python3
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

alias dockerrmi="docker images -q | xargs -n 1 docker rmi -f"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#export NVM_DIR="$HOME/.nvm"
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#alias nodeexperimental=export NODE_OPTIONS="--experimental-vm-modules --no-warnings"

#CPPFLAGS=-I/usr/local/opt/openssl/include 
#LDFLAGS=-L/usr/local/opt/openssl/lib

code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

#source <(npx zsh)

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
