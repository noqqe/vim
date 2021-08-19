# nvim

Please do not use without reading and understanding the configuration.
On github for automation reasons.

### This Repo

This Repo used to be my vim configuration, but I switched to neovim, which
supports `lua` configuration and vimscript configuration as well.

Since 0.5.0 version of neovim is out I no longer take care of compatiblitiy
to `vim` 8.0.

However, my vim config is needed from time to time. If you're interested in
that, see the branch `vim` in this repo, it will be updated from time to time
when needed

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

    git clone https://github.com/noqqe/vim ~/.config/nvim

If yes, make sure you backup your old config and run

``` bash
test -d ~/.config || mkdir ~/.config
test -d ~/.config/nvim && rm  ~/.config/nvim
git clone https://github.com/noqqe/vim ~/.config/nvim
nvim +PlugInstall
```
