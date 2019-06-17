# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh
brew install zsh

# Install antibody
brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
brew install antibody

# Setup antibody
antibody bundle < "~/.zsh_plugins.txt" > ~/.zsh_plugins.sh
antibody update

# Install nvim
brew install nvim
