" plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'                     " Nord color scheme
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'                           " default settings
Plug 'vim-pandoc/vim-pandoc'                        " pandoc support 
Plug 'vim-pandoc/vim-pandoc-syntax'                 " markdown syntax support 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Filetype detection
filetype plugin on

" Format indentation
if has("autocmd")
  filetype plugin indent on
endif

" Pandoc
let g:pandoc#formatting#mode = "hA"

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#filetypes = 'pandoc\|text\|' "Add support when pandoc is activated
let g:airline_theme='nord'

" Syntax coloration and color theme
syntax enable
set background=dark
colorscheme nord
