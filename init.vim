" Syntax coloration and color theme
syntax enable
set background=light
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
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>        " set C-l to :nohlsearch
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a			" Enable mouse usage (all modes)
set linebreak		" Line wrap
set tw=79           " Lines longer than 79 chars will be wrapped
set colorcolumn=+1  " Colors the tw+1 column
set number	        " Line numbering
set cursorline
set modeline

" Consider `.jsonld` as JSON
autocmd BufNewFile,BufRead *.jsonld set filetype=json
" tabstop to 2 for JSON
au FileType json set tabstop=2
au FileType json set softtabstop=2
au FileType json set shiftwidth=2

" fold
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
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#filetypes = 'pandoc\|text\|' "Add support when pandoc is activated

" vim-table-mode
:let g:table_mode_corner='|'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40

" vim-json, don't conceal
let g:vim_json_syntax_conceal = 0

" ctrlP
" match window position
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
"set the working directory
let g:ctrlp_working_path_mode = 'ra'
" enable caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Load vim-pandoc-syntax for markdown files
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'                           " default settings
Plug 'vim-pandoc/vim-pandoc-syntax'                 " markdown syntax support 
Plug 'reedes/vim-pencil'                            " for prose writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }          " distraction free
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeEnable' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Rykka/riv.vim'                                " rst syntax support
Plug 'Rykka/InstantRst'                             " rst preview
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'                         " pairs autocomplete
Plug 'tpope/vim-surround'                           " to manipulate surroundings
Plug 'tpope/vim-unimpaired'                         " toggle shortcut
Plug 'tpope/vim-commentary'                         " easy commenting
Plug 'elzr/vim-json'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'                           " git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/editorconfig/editorconfig-vim'
call plug#end()
