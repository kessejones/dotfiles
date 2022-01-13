set ai
set si
set lazyredraw
set smarttab
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

let mapleader = ' '
imap jk <ESC>
map <C-s> :w<CR>

nmap <Space>ss :w<CR>
nmap <Space>sq :wq<CR>
nmap <Space>q :q<CR>
nmap <Space>y yyp<ESC>
nmap <Space>cc :close<ESC>
nmap <Space>sv :vsplit<ESC>
nmap <Space>sh :split<ESC>
nmap <Space>wh :wincmd h<CR>
nmap <Space>wl :wincmd l<CR>
nmap <Space>wj :wincmd j<CR>
nmap <Space>wk :wincmd k<CR>

nmap <S-h> :bprevious<CR>
nmap <S-l> :bnext<CR>
