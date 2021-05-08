" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'                     " Nord color scheme
Plug 'chiefnoah/neuron-v2.vim'                                              " To manage Zettlekasten the neuron way
call plug#end()

" Filetype detection
filetype plugin on

" Format indentation
if has("autocmd")
  filetype plugin indent on
endif

" Python provider in a pyenv
let g:python3_host_prog='/home/igor/.pyenv/versions/neovim3/bin/python'

set hidden

" Syntax coloration and color theme
syntax enable
set background=dark
colorscheme nord
