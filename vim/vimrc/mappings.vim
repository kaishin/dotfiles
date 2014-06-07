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
nmap <C-q> <C-w>-
nmap <C-s> <C-w><
nmap <C-z> <C-w>+
nmap <Leader>R :tabe $MYVIMRC<CR>:vsp $HOME/.vim/vimrc/mappings.vim<CR>:sp $HOME/.vim/vimrc/plugins.vim<CR>

nmap <Leader>U :UltiSnipsEdit<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>q gqip
nmap <Leader>s ?{<CR>jV}k:sort<CR>
nmap <Leader>t :CtrlP<CR>
nmap <Leader>T :CtrlPBuffer<CR>
nmap <leader>' :%s/"/'/g<CR>
nmap <leader>G :Gbrowse<CR>
nmap <leader>V V`]
nmap <leader>b :sp<CR>
nmap <leader>e :%s/\n\{3,}/\r\r/e<CR> :echoe "Empty lines removed!"<CR>
nmap <leader>i ==
nmap <leader>v :vsp<CR>
nmap <leader>z za
nnoremap <leader>= <C-w>=
nnoremap <leader>P :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>r :wa<CR> :RRB<CR>
nnoremap <leader>L :NumbersToggle<CR>
nnoremap Q <nop>
vmap <leader>i ==
nmap <leader>W :call Wipeout()<CR>

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
