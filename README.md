# nvim

This is my `neovim` configuration. Its written in pure lua und not compatible
to `vim` anymore (see History)

Goals
* reusable for the public
* not containing machine specific configuration
* acceptable startup time
* no bloat

*Please do not use without reading and understanding the configuration.*

## Installation

```bash
git clone https://github.com/noqqe/vim ~/.config/nvim
nvim
```

## History

This repo used to be my `vim` configuration, but I switched to `neovim`, which
supports `lua` configuration and vimscript configuration as well.

Since 0.5.0 version of neovim is out I no longer take care of compatiblitiy
to `vim` 8.0.

However, my vim config is needed from time to time. If you're interested in
that, see the branch `vim` in this repo, it will be updated from time to time
when needed
