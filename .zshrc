source ~/antigen/antigen.zsh

export EDITOR=code
export PATH="$PATH:$HOME/.nvm/versions/node/v6.11.1/bin"

# Rust dev
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="/Users/bjorn/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# Python + Anaconda
# added by Miniconda3 4.2.12 installer
export PATH="/Users/bjorn/miniconda3/bin:$PATH"

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting

# Lazy nvm loading
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

antigen theme pure

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

antigen apply

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/bjorn/tools/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/bjorn/tools/google-cloud-sdk/path.zsh.inc'
fi

export PATH="$HOME/.yarn/bin:$PATH"

alias r='npm run'
alias d='npm run dev'
alias c='clear'
alias vim='nvim'

# OCaml/Reason dev
. /Users/bjorn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
