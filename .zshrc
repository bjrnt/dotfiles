#########
# PATH #
########

# Homebrew
export PATH="/usr/local/bin:$PATH"
# Golang dev
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin/:$GOPATH/bin:$PATH"
# Python
export PATH="/Users/bjorn/Library/Python/2.7/bin:$PATH"

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

###########
# PLUGINS #
###########

# Antibody installation https://github.com/getantibody/antibody/tree/master/docs
source ~/.zsh_plugins.sh

###########
# ALIASES #
###########

# Command replacements
alias cat='bat'
alias top='sudo htop'

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias updateconfig='config add -u; config c -m"Update Dotfiles"'

# General 
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias c='clear'
alias vim='nvim'
alias lg='lazygit'
alias dns='sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache'

# Dev Shortcuts 
function makeOrYarn {
  if [ -f $PWD/Makefile ]; then
    make $1
  else
    yarn run $2
  fi
}

alias r='yarn run'
alias tw='yarn run test:watch'

alias d='makeOrYarn "watch" "dev"'
alias t='makeOrYarn "test" "test"'
alias ti='makeOrYarn "integration" "test:integration"'

# Docker
alias dc='docker-compose'
alias stopconts='docker ps -aq | xargs -n 1 docker stop -t 0'
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

# fnm
eval "$(fnm env --multi)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# Autojump, https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bjorn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bjorn/google-cloud-sdk/path.zsh.inc'; fi
