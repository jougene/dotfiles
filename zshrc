export ZSH="/home/jgne/.oh-my-zsh"
export BROWSER=/usr/bin/firefox

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

dclearlogs() {
  sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"
}

alias python=python3
alias vi=nvim
alias ll='ls -alF'
alias dc='docker-compose'
alias gg='git grep -F -n'
alias k='kubectl'
alias gup='git fetch --all && git pull --rebase origin master'
alias gupf='gup && git push --force'
alias cc='clipcopy'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(kubectl completion zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
