# Dotfiles

## Dotfiles

Generate and add a SSH key to Github first.

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --recursive -j8 --bare git@github.com:bjrnt/dotfiles.git $HOME/.cfg

mkdir -p .config-backup && \ 
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \ 
xargs -I{} mv {} .config-backup/{}
config checkout
```

## Change Git user as needed

```
git config --global user.name "First Last"
git config --global user.email "me@domain.com"
```

## MacOS

```
sh ./macos/defaults.sh
```

## Apps

### Terminal

1. Download iTerm2
2. Load preferences from the `~/macos/iTerm` folder
3. `sh ./.dotfiles/scripts/bootstrap.sh` to install Homebrew and other utils

### NeoVim

- `:PlugInstall`

### Karabiner

1. Download Karabiner-Elements
2. Run it once
3. Rename the default profile to 'Default'
4. `vim ~/.config/karabiner.edn`
5. `goku`

### Alfred

1. Download and install
2. Setup powerpack
3. Setup preference folder
4. Workflows?

### Fonts

- Install from Google Drive

### Development

- [ ] Golang 

### VSCode

1. Download and install
2. Run settings sync
3. Login with Github and choose the latest Github gist

### Misc Apps

- [ ] Rectangle
- [ ] Things 3
- [ ] Spotify
- [ ] Fantastical
- [ ] Obsidian
