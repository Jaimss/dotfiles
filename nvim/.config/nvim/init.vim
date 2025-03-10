syntax on
filetype plugin indent on

set mouse=a

set clipboard=unnamedplus

set backspace=indent,eol,start

" zt,zb leave some lines visible
set scrolloff=4

" move up and down
"nnoremap j gj
"nnoremap k gk
"nnoremap gj j
"nnoremap gk k
" g(k/g) will move within a wrapped line. if we do a small move, we want to be
" inside the line. for big moves, do a normal move
function! SmartMove(key)
  let count = v:count
  if count <= 2
    if a:key ==# 'j'
      return 'gj'
    elseif a:key ==# 'k'
      return 'gk'
    endif
  else
    return a:key
  endif
endfunction

nnoremap <expr> j SmartMove('j')
nnoremap <expr> k SmartMove('k')

"fix spelling
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"ls -l ~/.local/share/nvim/site/spell/en.utf-8.add
"touch ~/.local/share/nvim/site/spell/en.utf-8.add
"chmod 600 ~/.local/share/nvim/site/spell/en.utf-8.add
set spellfile=~/.local/share/nvim/site/spell/en.utf-8.add

let g:python3_host_prog = '/usr/bin/python3'

" snippets
let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"
let g:UltiSnipsSnippetDirectories = ["~/.config/nvim/ultisnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<Shift-Tab>"

" makefile
nmap <C-m> :w!<cr> :!make<cr>

" latex
" add a debug option for pdflatex
nmap <C-d> :w!<cr> :!pdflatex -shell-escape --output-directory output %<cr>
nmap <C-w> :w!<cr> : silent exec '!pdflatex -shell-escape --output-directory output %'<cr>
nmap <C-h> :!zathura $(echo output/% \| sed 's/tex$/pdf/') & disown<cr><cr>

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

let g:vimtex_view_method = 'zathura'

" ~/ cleanup
set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
set viewdir=$XDG_DATA_HOME/vim/view
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

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

" line wrap
set wrap linebreak nolist

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

" cursor for vimrc
let &t_EI .= "\<Esc>[1 q"
let &t_SI .= "\<Esc>[6 q"

" no annoying error bells
set noerrorbells
set t_vb=
" set tm=500
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
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove<cr>

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

" html emmet
let g:user_emmet_expandabbr_key = '<c-e>'

" ycm
let g:ycm_key_list_select_completion = ['<Down>']

" plugins
set runtimepath+=~/.local/share/nvim/site/autoload
source ~/.local/share/nvim/site/autoload/plug.vim
call plug#begin("~/.local/share/nvim/site/autoload")

"Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
"Plug 'vim-airline/vim-airline'
"Plug 'ctrlpvim/ctrlp.vim'
" git
"Plug 'tpope/vim-fugitive'
" fold with za
"Plug 'https://github.com/tmhedberg/SimpylFold.git'
" python plugins
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
" linting
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" snippets
Plug 'SirVer/ultisnips'
" HTML Emmet
Plug 'mattn/emmet-vim'
" One Dark
Plug 'https://github.com/joshdick/onedark.vim.git'
" latex
Plug 'lervag/vimtex'

call plug#end()

" color scheme
set termguicolors
set bg=dark

colorscheme onedark
