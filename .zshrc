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
plugins=(z zsh-autosuggestions zsh-nvm-auto-switch colored-man-pages)

DISABLE_AUTO_TITLE="true"

DISABLE_MAGIC_FUNCTIONS=true

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=$(brew --prefix)/bin:$PATH:$JAVA_HOME/bin:/usr/local/bin:/usr/bin:/usr/sbin:~/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

alias dockerrmi="docker images -q | xargs -n 1 docker rmi -f"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias curltime="curl -w \"@$HOME/.curl-format.txt\" -o /dev/null -s "

code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

zed () {
    if [[ $# = 0 ]]
    then
        open -a "Zed"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Zed" --args "$F"
    fi
}

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
