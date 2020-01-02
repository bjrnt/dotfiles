set -e

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh
brew install nvim
brew install Schniz/tap/fnm
brew install bat
brew install htop

brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
brew install antibody

# Setup antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update

