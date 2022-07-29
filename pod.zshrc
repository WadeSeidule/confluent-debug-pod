# barebones zsh with some nice plugins

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    vi-mode
    aws
    docker
    golang
    helm
    history
    jsontools
    kubectx
    minikube
    npm
    nvm
    pip
    poetry
    python
    redis-cli
    ripgrep
    yarn
)


source $ZSH/oh-my-zsh.sh

# aliases
alias consume="confluent kafka topic consume"
alias list_topics="confluent kafka topic list"
alias search_topics="confluent kafka topic list | grep"