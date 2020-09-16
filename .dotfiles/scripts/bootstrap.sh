set -e

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh
brew install nvim
brew install Schniz/tap/fnm
brew install bat
brew install htop
brew install fzf
brew install fd
brew install yqrashawn/goku/goku
brew install autojump

brew install getantibody/tap/antibody

# Setup antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update

# Setup VimPlug
pip3 install --user neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

