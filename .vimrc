set ai
set si
set lazyredraw
set smarttab
set nobackup
set nowritebackup
set noswapfile
set noshowcmd
set clipboard=unnamedplus
set hlsearch
set ignorecase
set showtabline=2
set mouse=a
set autoindent
set background=dark
set expandtab
set shiftwidth=4
set smartindent
set title
set hidden
set number
set wrap
set cursorline
set scrolloff=5
set sidescrolloff=5
set wildmenu
set incsearch
set path+=**
set conceallevel=0
set completeopt=menu,menuone,noselect
set list
set listchars=eol:↴

colorscheme gruvbox

let mapleader = ' '
nnoremap <Space> <NOP>
inoremap jk <ESC>
nnoremap <ESC> :noh<CR>

nnoremap <Leader>ss :w<CR>
nnoremap <Leader>sq :wq<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>y yyp<ESC>

nnoremap <Leader>sv :vsplit<ESC>
nnoremap <Leader>sh :split<ESC>

nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>

nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <Leader>. :bdelete<CR>
nnoremap <Leader>.f :bdelete!<CR>

nnoremap <C-h> <ESC>:%s/

noremap <Leader>aa gg<S-v>G
noremap <Leader>ay gg<S-v>Gy

vnoremap < <gv
vnoremap > >gv
vnoremap ,, <ESC>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
