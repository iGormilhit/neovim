" Syntax coloration and color theme
syntax enable
set background=dark
colorscheme solarized

" Filetype detection
filetype plugin on

" Format indentation
if has("autocmd")
  filetype plugin indent on
endif

" add some tags for html indentations
:let g:html_indent_inctags = "html,body,head,tbody"

set smartindent
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
autocmd FileType json setlocal shiftwidth=2 tabstop=2

set showcmd			" Show (partial) command in status line.
set showmatch		" Show matching brackets.

set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a			" Enable mouse usage (all modes)

set linebreak		" Line wrap
set tw=79           " Lines longer than 79 chars will be wrapped
set colorcolumn=79  " Colors the 79th column

set number	        " Line numbering
set cursorline
set ruler
set modeline

" Markdown
" `.md` for markdown files
au FileType markdown set wrap
au FileType markdown set nocursorline 
au FileType markdown set linebreak
au FileType markdown set colorcolumn&

" fold
" Type de fold si c'est du JSON
autocmd FileType json setlocal foldmethod=syntax
" Détermine le niveau de fold par défaut pour le JSON
autocmd FileType json set foldlevel=2
" Détermine le niveau de fold par défaut pour le md
autocmd FileType markdown set foldlevel=0

let g:xml_syntax_folding=3
au FileType xml setlocal foldmethod=syntax
autocmd FileType xml set foldlevel=1

" vim-pandoc
" default languages grammar check
:let g:pandoc#spell#default_langs = ['fr', 'en']

" set C-l to :nohlsearch
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" copy to clipboard with `"+y`
set clipboard+=unnamedplus

" airline
let g:airline_powerline_fonts = 1

" vim-table-mode
:let g:table_mode_corner='|'

" netrw, instead of NERDTree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3

" vim-json, don't conceal
let g:vim_json_syntax_conceal = 0

" ctrlP
" set the working directory
let g:ctrlp_working_path_mode = 'ra'
" enable caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeEnable' }
Plug 'shime/vim-livedown', { 'on': 'LivedownPreview' }
Plug 'elzr/vim-json'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'
Plug 'davidhalter/jedi-vim'      " warning, may conflicts with python-mode
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
call plug#end()
