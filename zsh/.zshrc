# Path to your oh-my-zsh installation.
export ZSH="/Users/ttsuzuki/.oh-my-zsh"
ZSH_THEME="tobie-agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    command-not-found
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Example aliases
source ~/.aliases

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Android env variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Importing GUILD NPM Token
source ~/.secrets

# AWS Credential Rotation
rot () {
        STAGE=$@
        if [ -z "$@" ]; then
                STAGE=dev
        fi
        if [ "$STAGE" = "all" ]; then
                rot dev && rot staging && rot prod
        else
                aws sso login --profile guild-$STAGE &> /dev/null
        fi
}

# Make sure default region in AWS Set - We only use one region
export AWS_DEFAULT_REGION="us-west-2"

alias awsloginall='aws sso login --profile=guild-dev && aws sso login --profile=guild-staging && aws sso login --profile=guild-prod'
alias xdev='eval $(aws2-wrap --profile guild-dev --export) && export STAGE=dev'
alias xstaging='eval $(aws2-wrap --profile guild-staging --export) && export STAGE=staging'
alias xprod='eval $(aws2-wrap --profile guild-prod --export) && export STAGE=prod'

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# rosetta terminal setup
if [ $(arch) = "i386" ]; then
    alias ibrew="/usr/local/bin/brew"
    alias ipyenv="arch -x86_64 pyenv"
fi
