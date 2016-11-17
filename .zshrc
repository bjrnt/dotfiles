source ~/antigen/antigen.zsh

export EDITOR=atom
export PATH="$PATH:$HOME/.yarn/bin"

# Android Dev
# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
# export ANDROID_NDK=~/Library/Android/android-ndk-r10e

# OCaml Dev
# eval `opam config env`

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump

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
