" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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

set showcmd			" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a			" Enable mouse usage (all modes)
set linebreak		" Line wrap
set number	        " Line numbering 
set cindent
set smartindent
set autoindent
set tabstop=4		
set expandtab		
set softtabstop=4	
set shiftwidth=4	
set ruler
set wrap
set modeline

" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-pandoc/vim-pandoc.git'
Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/dhruvasagar/vim-table-mode.git', { 'on': 'TableModeEnable' }
Plug 'https://github.com/shime/vim-livedown.git', { 'on': 'LivedownPreview' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/elzr/vim-json.git'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/osyo-manga/vim-over', { 'on': 'OverCommandLine' }
call plug#end()


" fold
autocmd FileType json setlocal foldmethod=syntax    " Type de fold si c'est du JSON
autocmd FileType json set foldlevel=2               " Détermine le niveau de fold par défaut pour le JSON
autocmd FileType markdown set foldlevel=0           " Détermine le niveau de fold par défaut pour le md

let g:xml_syntax_folding=3
au FileType xml setlocal foldmethod=syntax
autocmd FileType xml set foldlevel=1

" `.md` for markdown files
au BufRead,BufNewFile *.md set filetype=markdown

" vim-pandoc
:let g:pandoc#spell#default_langs = ['fr', 'en', 'de_de']  " default languages grammar check 

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

" vim-json, don't conceal
let g:vim_json_syntax_conceal = 0
