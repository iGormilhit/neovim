" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'                         " Many languages syntax support
                                                    " Should be on top to be overwritten by pandoc
Plug 'tpope/vim-sensible'                           " default settings
Plug 'vim-pandoc/vim-pandoc'                        " pandoc support 
Plug 'vim-pandoc/vim-pandoc-syntax'                 " markdown syntax support 
Plug 'arcticicestudio/nord-vim'                     " Nord color scheme
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }          " distraction free
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeEnable' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'gu-fan/riv.vim', { 'for': 'rst' }             " rst syntax support
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'                         " pairs autocomplete
Plug 'tpope/vim-surround'                           " to manipulate surroundings
Plug 'tpope/vim-unimpaired'                         " toggle shortcut
Plug 'tpope/vim-commentary'                         " easy commenting
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'                           " git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/editorconfig/editorconfig-vim'
" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'                          " source for python autocompletion
Plug 'Shougo/neco-syntax'                           " other sources for autocompletion
Plug 'davidhalter/jedi-vim'                         " Code jump
Plug 'neomake/neomake'                              " Python linting
" Imports sorting
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'vitalk/vim-simple-todo'
" Search
Plug 'jremmen/vim-ripgrep'                          " Use ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Filetype detection
filetype plugin on

" Format indentation
if has("autocmd")
  filetype plugin indent on
endif

" add some tags for html indentations
let g:html_indent_inctags="html,body,head,tbody"

set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showcmd			" Show (partial) command in status line.
set showmode        " Show indication of having changed modes
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " Highlight search
let g:rg_highlight='true'                           " Activate ripgrep Highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>        " set C-l to :nohlsearch
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a			" Enable mouse usage (all modes)
set linebreak		" Line wrap
set tw=79           " Lines longer than 79 chars will be wrapped
autocmd FileType gitcommit set textwidth=72         " Wrap lines longer than 72 chars for git messages
set colorcolumn=+1  " Colors the tw+1 column
autocmd FileType gitcommit set colorcolumn+=51      " Add a colored column at 51 chars for git message titles
set number	        " Line numbering
au TermOpen * setlocal listchars= nonumber norelativenumber
set cursorline
set modeline

set spell
set spelllang=fr,en
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal spelllang=en


" Consider `.jsonld` as JSON
autocmd BufNewFile,BufRead *.jsonld set filetype=json
" tabstop to 2 for JSON
au FileType json set tabstop=2
au FileType json set softtabstop=2
au FileType json set shiftwidth=2

" fold
set foldmethod=syntax
set foldlevel=1
" Type de fold si c'est du JSON
autocmd FileType json setlocal foldmethod=syntax
" Détermine le niveau de fold par défaut pour le JSON
autocmd FileType json set foldlevel=2
autocmd FileType json set tabstop=2
autocmd FileType json set softtabstop=2
" Détermine l'indentation par défaut pour le html
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2
autocmd FileType html set shiftwidth=2

let g:xml_syntax_folding=3
au FileType xml setlocal foldmethod=syntax
autocmd FileType xml set foldlevel=1

" copy to clipboard with `"+y`
set clipboard+=unnamedplus

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#wordcount#filetypes='pandoc\|text\|' "Add support when pandoc is activated
let g:airline_theme='nord'

" vim-table-mode
let g:table_mode_corner='|'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40

" vim-json, don't conceal
let g:vim_json_syntax_conceal=0

" ctrlP
" match window position
let g:ctrlp_match_window='top,order:ttb,min:1,max:10,results:10'
"set the working directory
let g:ctrlp_working_path_mode='ra'
" enable caching
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0

" Pandoc
" Autoformatting with hardwrap
let g:pandoc#formatting#mode="hA"
" ctrl+s switch to softwrap
nnoremap <C-s> :call pandoc#formatting#UseSoftWraps()
" ctrl+h switch to hardwrap
nnoremap <C-h> :call pandoc#formatting#UseHardWraps()
" ctrl+t toggle autoformat (mainly to deactivate it when necessary)
nnoremap <C-t> :call pandoc#formatting#ToggleAutoformat()

" autocompletion
let g:deoplete#enable_at_startup=1                " start deoplete at startup
" Close suggestion window at completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Use tab to sensible items in the suggestion list
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Code jump
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled=0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers="right"

" Python provider in a pyenv
let g:python3_host_prog='/home/igor/.pyenv/versions/neovim3/bin/python'

" Python linting
let g:neomake_python_enabled_makers=['flake8']

" Imports sorting
let g:isort_command='isort'

call neomake#configure#automake('nrwi', 500)        " autolint

" Should avoid deoplete to slow down the closing process
" au TermClose * call OnTermClose()

" Syntax coloration and color theme
syntax enable
set background=dark
colorscheme nord
