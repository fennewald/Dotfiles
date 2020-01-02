call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme default

set showmatch
set ignorecase
set tabstop=4
set shiftwidth=4
set autoindent
set number
set cc=80
filetype plugin indent on
let g:airline_theme='deus'
autocmd VimEnter * NERDTree
syntax on
