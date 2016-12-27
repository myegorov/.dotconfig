# dotfiles

Manage dotfiles as a Git bare [repository](https://news.ycombinator.com/item?id=11070797).

## initial setup

```shell
git init --bare $HOME/.dotconfig
echo "alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotconfig/ --work-tree=$HOME'" >> $HOME/.zshrc
source $HOME/.zshrc
dotconfig config --local status.showUntrackedFiles no
```

## track files using Git

```shell
dotconfig status
dotconfig add .vimrc
dotconfig commit -m "add .vimrc"
dotconfig push
```

## clone on a different machine

```shell
git clone --separate-git-dir=$HOME/.dotconfig https://github.com/myegorov/.dotconfig.git $HOME/.dotconfig.tmp
rsync -rv --exclude '.git' $HOME/.dotconfig.tmp/ $HOME/
rm -rf $HOME/.dotconfig.tmp
source $HOME/.zshrc
dotconfig config --local status.showUntrackedFiles no
```
