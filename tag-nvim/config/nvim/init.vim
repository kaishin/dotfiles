filetype plugin indent on

highlight LineNr ctermbg=none ctermfg=62
highlight Normal ctermbg=none
highlight SignColumn ctermbg=none

set autoindent
set backspace=2
set clipboard=unnamedplus
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=""
set mouse=a
set nobackup
set nocompatible
set noshowmode
set noswapfile
set nowritebackup
set number
set numberwidth=5
set shell=bash
set shiftround
set shiftwidth=2
set showmatch
set softtabstop=4
set splitbelow
set splitright
set tabstop=2
set ttyfast
set wildmode=longest,list

syntax on

imap <c-a> <esc>
vmap <c-a> <esc>
nmap <return> :

imap jk <esc>
imap kj <esc>
imap jj <esc>
imap kk <esc>

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <c-q> <c-w>-
nmap <c-a> <c-w>>
nmap <c-s> <c-w><
nmap <c-z> <c-w>+

nmap <leader>r :vsp $MYVIMRC<cr>
nmap <leader>b :sp<cr>
nmap <leader>v :vsp<cr>
nmap <leader>s :w<cr>

nnoremap <left> :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up> :echoe "use k"<cr>
nnoremap <down> :echoe "use j"<cr>
