export EDITOR=code

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Rust dev
export PATH="$HOME/.cargo/bin:$PATH"

# Golang dev
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/go"

# https://carlosbecker.com/posts/speeding-up-zsh/
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/bjorn/.zshrc'

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
	compinit
else
	compinit -C
fi

# Antibody installation https://github.com/getantibody/antibody/tree/master/docs
source ~/.zsh_plugins.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# My Aliases
alias r='yarn run'
alias t='yarn run test -w 2'
alias tw='yarn run test:watch -w 2'
alias d='yarn run dev'
alias s='yarn run storybook'
alias c='clear'
alias vim='nvim'
alias rr='git reset --hard && git checkout master && git pull'
pr() {
	open $(git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's/\.git//')/compare/$(git branch -a | grep -v remotes | grep SPRINT | awk '{$1=$1};1')...$(git rev-parse --abbrev-ref HEAD)
}
alias n='nvm use default'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

SPACESHIP_PROMPT_ORDER=(
   dir
   exec_time
   git
   line_sep
   jobs
   exit_code
   char
)

# Autojump, https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
