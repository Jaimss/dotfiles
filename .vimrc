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
imap jk <Esc>

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
set encoding=utf-8

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

" python related stuff
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']
let python_highlight_all=1

" nerd tree 
" autocmd vimenter * NERDTree
map <leader>n :NERDTreeToggle<Cr>

" ctrl p
map <leader>p :CtrlP<cr>

" plugins
call plug#begin()

" folding
set foldlevel=99

Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
" git
Plug 'tpope/vim-fugitive'
" fold with za
Plug 'https://github.com/tmhedberg/SimpylFold.git'
" python plugins
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
" kotlin plugins
Plug 'udalov/kotlin-vim'
" Docker
Plug 'ekalinin/Dockerfile.vim'

call plug#end()
