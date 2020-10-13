syntax on

" color scheme
colorscheme onedark
let g:airline_theme='one'

set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set number
set relativenumber
set splitright

" disable arrows
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

" swap / undo
set noswapfile
set nobackup
set undofile
" undo directory (1st for my windows location, second for linux)
" if someone copies this you gotta change these prob
if isdirectory('D:\Installs\Vim\undodir')
    set undodir=D:\Installs\Vim\undodir
endif
if isdirectory('/home/james/.vim/undodir')
    set undodir=/home/james/.vim/undodir
endif

" cursor for vimrc
let &t_EI .= "\<Esc>[1 q"
let &t_SI .= "\<Esc>[6 q"

" no annoying error bells
set noerrorbells
set t_vb=
set tm=500
set visualbell

" leader key
let mapleader = " "

" Mapping
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
map <C-space> ?
map <silent> <leader><cr> :noh<cr>

map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

map <leader>i I
map <leader>a A

" move a selected code block up or down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" system commands
map <leader>s "*
vnoremap <leader> s "*

" The shell for commands
" set shell=powershell
" set shellcmdflag=-command
" set shellquote=\"
" set shellxquote=

" avoid random characters (for windows)
let $LANG='en'
set langmenu='en'
set encoding=utf8

" wild menu
set wildmenu

" show location
set ruler

" search / case
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic

" nerd tree 
autocmd vimenter * NERDTree
map <leader>n :NERDTreeToggle<Cr>

" ctrl p
map <leader>p :CtrlP<cr>

" plugins
call plug#begin()

Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

call plug#end()