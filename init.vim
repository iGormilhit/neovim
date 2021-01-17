" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'                                                 " Many languages syntax support. Should be on top to be overwritten by pandoc
Plug 'tpope/vim-sensible'                                                   " Default sensible settings
Plug 'vim-pandoc/vim-pandoc'                                                " Pandoc support 
Plug 'vim-pandoc/vim-pandoc-syntax'                                         " Markdown syntax support 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }     " Markdown preview
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeEnable' }              " Helper for table in markdown
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }                                  " Distraction free mode for writing
Plug 'dpelle/vim-Grammalecte'                                               " French ortho/grammar spelling
Plug 'arcticicestudio/nord-vim'                                             " Nord color scheme
Plug 'vim-airline/vim-airline'                                              " Fancy bottom line in vim/neovim
Plug 'vim-airline/vim-airline-themes'                                       " Themes for vim-airlines
Plug 'jiangmiao/auto-pairs'                                                 " Pairs autocomplete
Plug 'tpope/vim-surround'                                                   " To manipulate surroundings
Plug 'tpope/vim-unimpaired'                                                 " Toggle shortcut
Plug 'tpope/vim-commentary'                                                 " Easy commenting
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }                     " Search Multiple Highlighting
Plug 'scrooloose/nerdtree'                                                  " Side window files navigation
Plug 'tpope/vim-fugitive'                                                   " Git commands, useful for other plugins such as nerdtree or fzf
Plug 'Xuyuanp/nerdtree-git-plugin'                                          " To see new or modified files in the nerdtree window
Plug 'https://github.com/editorconfig/editorconfig-vim'                     " Support of '.editorconfig' files
Plug 'vim-syntastic/syntastic'                                              " Syntax checking (linting)
" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'                                                  " source for python autocompletion
Plug 'Shougo/neco-syntax'                                                   " other sources for autocompletion
Plug 'davidhalter/jedi-vim'                                                 " Code jump
" Imports sorting
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'vitalk/vim-simple-todo'
" Search
Plug 'kien/ctrlp.vim'                                                       " Search 'Ctrl+P' like
Plug 'jremmen/vim-ripgrep'                                                  " Use ripgrep as vimgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                         " Fuzzy search, ensure fzf is fresh installed
Plug 'stsewd/fzf-checkout.vim'                                              " Fuzzy search in git branches
Plug 'junegunn/fzf.vim'                                                     " fzf for vim/neovim
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
set showcmd                                                                 " Show (partial) command in status line.
set showmode                                                                " Show indication of having changed modes
set showmatch                                                               " Show matching brackets.
set ignorecase                                                              " Do case insensitive matching
set smartcase                                                               " Do smart case matching
set incsearch                                                               " Enable incremental search
set hlsearch                                                                " Highlight search
let g:rg_highlight='true'                                                   " Activate ripgrep Highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>                                " set C-l to :nohlsearch
set autowrite                                                               " Automatically save before commands like :next and :make
set hidden                                                                  " Hide buffers when they are abandoned
set mouse=a                                                                 " Enable mouse usage (all modes)
set linebreak                                                               " Line wrap
set tw=79                                                                   " Lines longer than 79 chars will be wrapped
autocmd FileType gitcommit set textwidth=72                                 " Wrap lines longer than 72 chars for git messages
set colorcolumn=+1                                                          " Colors the tw+1 column
autocmd FileType gitcommit set colorcolumn+=51                              " Add a colored column at 51 chars for git message titles
set number	                                                                " Line numbering
set cursorline                                                              " Color the cursor line
set modeline                                                                " Support modelines
" Terminal
au TermOpen * setlocal listchars= nonumber norelativenumber                 " Start terminal buffer without line numbering

" Spelling activated, by default for French and English
set spell
set spelllang=fr,en
" Specific spelling configuration for git commit messages
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal spelllang=en
" Path for grammalecte-cli to get grammar check in French
let g:grammalecte_cli_py='/usr/bin/grammalecte-cli'

" Consider `.jsonld` as JSON
autocmd BufNewFile,BufRead *.jsonld set filetype=json
" tabstop to 2 for JSON
au FileType json set tabstop=2
au FileType json set softtabstop=2
au FileType json set shiftwidth=2

" Fold
set foldmethod=syntax
set foldlevel=1
" Fold type for JSON
autocmd FileType json setlocal foldmethod=syntax
" Default fold type for JSON
autocmd FileType json set foldlevel=2
autocmd FileType json set tabstop=2
autocmd FileType json set softtabstop=2
" Default fold type for HTML 
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2
autocmd FileType html set shiftwidth=2
" Default fold type for XML 
let g:xml_syntax_folding=3
au FileType xml setlocal foldmethod=syntax
autocmd FileType xml set foldlevel=1

" Copy to clipboard with `"+y`
set clipboard+=unnamedplus

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#wordcount#filetypes='pandoc\|text\|'                   "Add support when pandoc is activated
let g:airline_theme='nord'

" Vim-table-mode. Set the table separator
let g:table_mode_corner='|'

" NERDTree. By default, NERDTree is open when no file is provided when launching vim/neovim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40

" vim-json, don't conceal
let g:vim_json_syntax_conceal=0

" ctrlP
" Match window position, number of results
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
let g:mkdp_filetypes = ['markdown', 'pandoc', 'pandoc.markdown']

" Linters (syntastic configuration)
" SCSS linter
let g:syntastic_scss_checkers = ['scss_lint']
" Python linters. I define this list mainly to avoid pylint which I can't
" manage to use correctly and is required on my main OS.
let g:syntastic_python_checkers=['flake8', 'pep8', 'pycodestyle', 'pyflakes']
" Copy pasting of the basic configuration recommended by syntastic
" https://github.com/vim-syntastic/syntastic#settings
" but without the statusline settings to improve comptability with airline.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

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

" Imports sorting
let g:isort_command='isort'

" Syntax coloration and color theme
syntax enable
set background=dark
colorscheme nord
