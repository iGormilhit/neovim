# My `neovim` setup

Having used `neovim` for a few month, with symlinks for the configuration and
the plugins, I want to start a new setup.

Firstly, I don't use any more `pathogen` for the management of plugins, but
`vim-plug` instead. To install and activate `vim-plug` see the
[documentation][1].

I'm using the [nord color scheme][5].

## To do

- [ ] Document how to use `pyenv` to provide a python engine.
- [ ] Identify the python package dependencies.

## Requirements

1. `neovim`
1. `git`
1. `nodejs`, `yarn`
1. [ripgrep][2]
1. [The Silver Searcher (`ag`)][3]
1. `grammalecte`, the python standalone program.

## Installation

1. Clone the repository.
1. Create a symlink.
1. Check [the requirements][4].
1. Start `neovim`.
1. Install the plugins (`:PlugInstall`).

``` bash
git clone <URL>
ln -s neovim .config/neovim
nvim
:PlugInstall
```

[1]: https://github.com/junegunn/vim-plug/blob/master/README.md#neovim
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/ggreer/the_silver_searcher
[4]: /requirements
[5]: https://www.nordtheme.com/ports/vim
