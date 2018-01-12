
export EDITOR=code

# Rust dev
export PATH="$HOME/.cargo/bin:$PATH"

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/bjorn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Python + Anaconda
# added by Miniconda3 4.2.12 installer
# export PATH="/Users/bjorn/miniconda3/bin:$PATH"

# Antibody installation https://github.com/getantibody/antibody/tree/master/docs
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# From http://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# The next line updates PATH for the Google Cloud SDK.
# if [ -f /Users/bjorn/tools/google-cloud-sdk/path.zsh.inc ]; then
#  source '/Users/bjorn/tools/google-cloud-sdk/path.zsh.inc'
# fi

# export PATH="$HOME/.yarn/bin:$PATH"

alias r='yarn run'
alias t='yarn run test'
alias d='yarn run dev'
alias stb='yarn run storybook'
alias c='clear'
alias vim='nvim'
alias rr='git reset --hard && git checkout master && git pull'
pr() {
  open $(git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's/\.git//')/compare/$(git rev-parse --abbrev-ref HEAD)
}

# OCaml/Reason dev
. /Users/bjorn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true



