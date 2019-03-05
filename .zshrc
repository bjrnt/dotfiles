##################
# GLOBAL OPTIONS #
##################

export EDITOR=code
export DISABLE_AUTO_UPDATE=true
export LC_ALL=en_US

###############
# ZSH Options #
###############

# History
# - Appends every command to the history file once it is executed
setopt inc_append_history
# - Reloads the history whenever you use it
# setopt share_history

# https://carlosbecker.com/posts/speeding-up-zsh/
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/bjorn/.zshrc'

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
	compinit
else
	compinit -C
fi

ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

########
# PATH #
########

# Homebrew
export PATH="/usr/local/bin:$PATH"
# Golang dev
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin/:$GOPATH/bin:$PATH"

###########
# PLUGINS #
###########

# Antibody installation https://github.com/getantibody/antibody/tree/master/docs
source ~/.zsh_plugins.sh

###########
# ALIASES #
###########

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# General 
alias c='clear'
alias vim='nvim'
alias lg='lazygit'

# JavaScript Dev
alias n='nvm use'
alias r='yarn run'
alias t='yarn run test'
alias tw='yarn run test:watch'
alias d='yarn run dev'

# Docker
alias dc=docker-compose
alias stopconts='docker ps -aq | xargs -n 1 docker stop'
alias delconts='docker ps -aq | xargs -n 1 docker rm -v'
alias die='stopconts; delconts'

# Git
pr() {
	PARENT_BRANCH=$(git show-branch | grep -F '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//')
	open $(git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's/\.git//')/compare/$PARENT_BRANCH...$(git rev-parse --abbrev-ref HEAD)
}

###############
# LOOK & FEEL #
###############

SPACESHIP_PROMPT_ORDER=(
   dir
   exec_time
   git
   line_sep
   jobs
   exit_code
   char
)

##############
# TOOL SETUP #
##############

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# Autojump, https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Docker-based Golang development
# TODO: iterate on this
alias god='docker run --net=party -p 8080:80 --rm=true -it -v `pwd`:/go/src/app -w /go/src/app golang go "$@"'
function gvt() {
  echo "== gvt" "$@" "=="
  if [ $1 == "fetch" ]; then
    BASE="vendor/"
    if [ -d "$BASE$2" ]; then
      return
    fi
  fi
  docker run --dns=8.8.8.8 \
             --dns=8.8.4.4 \
             --rm=true -i \
             -v $(pwd):/go/src \
             justincormack/gvt "$@"
}

