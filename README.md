# vim

Please do not use without reading and understanding the configuration.
On github for automation reasons.

### Custom Keybindings

* `-r` - Reload all configurations (after config change)
* `-P` - Cleanup + Install + Update all Plugins
* `-n` - Toggle line numbers
* `-p` - Toggle paste mode
* `-s` - Toggle spell checking
* `-w` - Strip trailing whitespace
* `-g` - Toggle git gutter line markers
* `-e` - Check for syntaxerrors with syntastic

### Installation

Make sure you save your old vimrc and its directory somewhere else before doing
this.

``` bash
git clone https://github.com/noqqe/vim ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall
```

### Release.sh

I order to fully automate my deployments for vim, I created a little script
which is made for doing exactly this. It creates and releases a folder with
all plugins with out the `.git` stuff.

``` bash
./release.sh
```
