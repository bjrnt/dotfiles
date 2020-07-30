# Dotfiles

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
