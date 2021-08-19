# nvim

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
* `-d` - past current date as like 2017-08-29 15:27

### Installation

If you never used `neovim` before

    git clone  --single-branch --branch neovim https://github.com/noqqe/vim ~/.config/nvim

If yes, make sure you backup your old config and run

``` bash
test -d ~/.config || mkdir ~/.config
test -d ~/.config/nvim && rm  ~/.config/nvim
git clone https://github.com/noqqe/vim ~/.config/nvim
nvim +PlugInstall
```
