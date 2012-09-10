" Set Leader to <spacebar>
let mapleader = " "

" Go back to normal mode with jk OR kj OR jj OR kk
imap jj <Esc>jj
imap kk <Esc>kk
imap hh <Esc>hh
imap ll <Esc>ll

" Remap Caps lock
imap <C-a> <Esc>
vmap <C-a> <Esc>

" Saves time
nmap <return> :

" Handy shortcuts
nmap <Leader>n :NERDTreeToggle<cr>
nmap <Leader>t :CommandT<cr>
nmap <Leader>v :e $MYVIMRC<cr>
nmap <leader>u :source $MYVIMRC<cr> :echoe "Vimrc sourced!"<cr>
map <leader>c <c-_><c-_>

" CSS Sorting
nmap <Leader>s ?{<CR>jV}k!sortcss<CR>:noh<CR>

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
