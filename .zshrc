#########
# PATH #
########

# Homebrew
export PATH="/usr/local/bin:$PATH"
# Golang dev
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin/:$GOPATH/bin:$PATH"

##################
# GLOBAL OPTIONS #
##################

export EDITOR=nvim
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
zstyle :compinstall filename "$HOME/.zshrc"

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
alias vim='nvim'

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias updateconfig='config add -u; config c -m"Update Dotfiles"; config push'

# General 
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias c='clear'
alias lg='lazygit'

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
if command -v fnm &> /dev/null; then
  eval "$(fnm env --multi)"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# Autojump, https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

