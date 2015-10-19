# vim

Just my vim configuration. On github for automation reasons.

### Installation

Make sure you save your old vimrc and its directory somewhere else before doing
this.

``` bash
git clone https://github.com/noqqe/vim ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall
```
