# My `neovim` setup

Having used `neovim` for a few month, with symlinks for the configuration and the plugins, I want to start a new setup.

Firstly, I don't use any more `pathogen` for the management of plugins, but `vim-plug` instead. To install `vim-plug` see the [documentation](https://github.com/junegunn/vim-plug/blob/master/README.md#neovim).

## Requirements

1. `neovim`
2. `git`
3. `nodejs` et `npm`

## Installation

1. clone the repository
2. create a symlink
3. start `neovim`
4. install the plugins
5. check the requirements

``` bash
git clone <URL>
ln -s neovim .config/neovim
nvim
:PlugInstall
```

## Requirements for the plugins used

For `vim-colors-solarized`, a symlink is needed:

``` bash
cd $HOME/neovim/colors #or the dir. where you've clone this repository
ln -s ../plugged/vim-colors-solarized/colors/solarized.vim solarized.vim
```

For `vim-livedown`, the `node` `livedown` package needs to be installed globally:

`npm install -g livedown`

For `InstantRst`, the python package `instant-rst` is needed. See the [documentation](https://github.com/Rykka/InstantRst#1install).
