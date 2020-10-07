syntax on
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" swap / undo
set noswapfile
set nobackup
set undodir=D:\Installs\Vim\undodir
set undofile

" Nice settings to have
set number
set relativenumber
set splitright

" no annoying error bells
set noerrorbells
set t_vb=
set tm=500
set visualbell

" leader key
let mapleader = " "

" Mapping
nmap <leader>w :w!<cr>
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

map <leader>pv :wincmd v<bar> :Ex<bar> :vertical resize 30<cr>

" The shell for commands
set shell=powershell
set shellcmdflag=-command
set shellquote=\"
set shellxquote=

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
