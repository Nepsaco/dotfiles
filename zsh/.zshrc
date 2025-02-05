# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

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

# #Android env variables
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# # rosetta terminal setup
# if [ $(arch) = "i386" ]; then
#     alias ibrew="/usr/local/bin/brew"
#     alias ipyenv="arch -x86_64 pyenv"
# fi

# # Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export PATH="$HOME/.cargo/bin:$PATH"
#
# [[ -s "/Users/ttsuzuki/.gvm/scripts/gvm" ]] && source "/Users/ttsuzuki/.gvm/scripts/gvm"

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export MYSQL_HOST=127.0.0.1

# export eval $(gpg --decrypt ~/api-keys.txt.gpg)

function ecs-shell-rails-edge-session() {
     aws ecs execute-command --cluster rentable_rails_production --task $(aws ecs list-tasks --cluster rentable_rails_production --service "rentable_rails_web_edge_production" --desired-status RUNNING --query 'taskArns[0]' --output text) --interactive --command "su deployuser"
}

function ecs-shell-rails-prod-session() {
     aws ecs execute-command --cluster rentable_rails_production --task $(aws ecs list-tasks --cluster rentable_rails_production --service "rentable_rails_sidekiq_advertising_production" --desired-status RUNNING --query 'taskArns[0]' --output text) --interactive --command "su deployuser"
}

