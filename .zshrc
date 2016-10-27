source ~/antigen/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle tarruda/zsh-autosuggestions

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Lazy nvm loading
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Load theme
antigen theme pure

# Add config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

antigen apply
