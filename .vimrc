syntax on

" search / case
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic

" tabs / indentation
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set autoindent
set nowrap

" line numbers
set number
set relativenumber

" split things to the right not the left
set splitright

" show matching brace/bracket
set showmatch

" disable arrows 
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
   exec 'noremap' key '<Nop>'
   exec 'inoremap' key '<Nop>'
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

" Mapping, esc with jk
imap jk <Esc>

" write and quit with leader keys 
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
map <C-space> ?

" remove highlighting from searches and whatnot 
map <silent> <leader><cr> :noh<cr>

" move to different windows with leader keys
map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

" manage tabs with leader+t etc 
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" system commands
map <leader>s "*
vnoremap <leader> s "*

" language related
let $LANG='en'
set langmenu='en'
set encoding=utf-8

" wild menu
set wildmenu

" show location
set ruler

" python related stuff
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']
let python_highlight_all=1
let g:validator_python_checkers = ['flake8']
let g:validator_permament_sign = 1

" nerd tree 
" autocmd vimenter * NERDTree
map <leader>n :NERDTreeToggle<Cr>

" ctrl p
map <leader>p :CtrlP<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

" folding
set foldlevel=99

" plugins
call plug#begin()

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
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
" Docker
Plug 'ekalinin/Dockerfile.vim'
" theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
" linting
Plug 'maralla/validator.vim'

" dev elara plugin
" Plug '/home/james/Documents/GithubStuff/Jaims/elara-vimsyntax'

call plug#end()

" color scheme
set termguicolors
set bg=dark

" for gruvbox
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" for onehalf
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

