# My `neovim` setup

I'm trying to document my neovim setup. Mostly, I'm using neovim to edit
markdown, HTML, CSS/SCSS and python files.

I'm using `vim-plug` as a plugin manager. To install and activate `vim-plug`
see the [documentation][1].

I'm using the [nord color scheme][5].

## To do

- [ ] Document how to use `pyenv` to provide a python engine.
- [ ] Identify the python package dependencies.
  - `jedi`.
  - `jedi-language-server`.
  - `flake8`.
  - `neovim`.
  - `pycodestyle`.
  - `pyflakes`.
  - `pynvim`.

## Requirements

1. `neovim`
1. `git`
1. `nodejs`, `yarn`
1. [vim-plug][1]
1. [ripgrep][2]
1. [The Silver Searcher (`ag`)][3]
1. `grammalecte`, the python standalone program.
1. All or any of these python linters: `pep8`, `flake8`, `pycodestyle`,
   `pyflakes`.
1. `scss_lint` (ruby), for SCSS lint.

## Installation

1. Clone the repository.
1. Create a symlink.
1. Check [the requirements][4].
    - [Install `vim-plug`][7].
1. Start `neovim`.
1. Install the plugins (`:PlugInstall`).

``` bash
git clone <URL>
ln -s neovim .config/neovim
nvim
:PlugInstall
```

## External configuration

In order to improve the `fzf` preview window display, it's possible to
configure it through the following `env` variable:

```bash
export FZF_DEFAULT_OPTS="--preview='bat --style=numbers --color=always --line-range :500 {}' \
                         --border \
                         --color 'border:#4c566a,info:#4c566a,pointer:#88c0d0,prompt:#5e81ac,bg+:#3b4252,hl:#a3be8c'"
```

See the `fzf` documentation: <https://github.com/junegunn/fzf#preview-window>

[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/BurntSushi/ripgrep
[3]: https://github.com/ggreer/the_silver_searcher
[4]: /requirements
[5]: https://www.nordtheme.com/ports/vim
[7]: https://github.com/junegunn/vim-plug#installation
