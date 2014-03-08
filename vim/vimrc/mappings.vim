" Set Leader to <spacebar>
let mapleader = " "

" Remap Caps lock
imap <C-a> <Esc>
vmap <C-a> <Esc>

" Saves time
nmap <return> :

" Handy shortcuts
map <leader>c <c-_><c-_>
nmap <C-a> <C-w>>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-s> <C-w><
nmap <C-q> <C-w>-
nmap <C-z> <C-w>+
nmap <leader>b :sp<CR>
nmap <leader>e :%s/\n\{3,}/\r\r/e<cr> :echoe "Empty lines removed!"<cr>
nmap <leader>G :Gbrowse<CR>
nmap <leader>i ==
nmap <Leader>n :NERDTreeToggle<cr>
nmap <Leader>R :tabe $MYVIMRC<cr>:vsp $HOME/.vim/vimrc/mappings.vim<cr>
nmap <leader>r :vsp<CR>
nmap <leader>S :source $MYVIMRC<cr> :echoe "vimrc sourced!"<cr>
nmap <Leader>s ?{<CR>jV}k:sort<CR>
nmap <Leader>t :CtrlP<cr>
nmap <Leader>U :UltiSnipsEdit<cr>
nmap <leader>V V`]
nmap <leader>z za
nmap <leader>' :%s/"/'/g<cr>
nnoremap <leader>= <C-w>=
nnoremap <leader>l :NumbersToggle<CR>
nnoremap <leader>T :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
vmap <leader>i ==
nnoremap Q <nop>

" Sneak Mappings
nmap , <Plug>SneakForward
nmap K <Plug>SneakBackward
nmap <leader> <Plug>SneakNext
nmap <bs> <Plug>SneakPrevious

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Neocomplcache
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
