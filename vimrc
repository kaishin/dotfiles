call pathogen#infect()

" Hide that butt-ugly toolbar
set guioptions=egmrt
set guioptions-=r

" Look & Feel

colorscheme sexy-railscasts

set guifont=Inconsolata\ for\ Powerline:h15
let Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme="skwp"
" let g:Powerline_colorscheme="skwp"

" ======================================================= Mappings

" Go back to normal mode with jk OR kj OR jj OR kk
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>
imap kk <Esc>

" Remap Caps lock
imap <C-a> <Esc>
vmap <C-a> <Esc>

" Easier tab completion
imap <Tab> <C-P>

" Saves time
nmap <return> :

" Handy shortcuts
nmap <Leader>n :NERDTreeToggle<cr>
nmap :t :CommandT<cr>

" Set zen coding to new shortcut
let g:user_zen_expandabbr_key = '<c-z>'
let g:user_zen_settings = {
\  'indentation' : ' '
\}

" MITx Shortcuts
nmap -t :cd ~/Sites/mitx_all/templates/<cr>
nmap -a :cd ~/Sites/mitx_all/askbot-devel/askbot/skins/<cr>

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" CSS Sorting
vmap <Leader>1 :!sort<CR>
map <Leader>2 !sortcss<CR>
map <Leader>3 viB !sortcss<CR>
map <Leader>4 ?{<CR>jV}k!sortcss<CR>:noh<CR>

"Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" SCSS syntax highlighting (cakebaker)
au BufRead,BufNewFile *.scss set filetype=scss

" Vim backups
" set backupdir=~/.vim_backups//
" set directory=~/.vim_backups//
set nobackup
set nowritebackup
set noswapfile

" Highlight cursor Line + Column
set cursorline
set cursorcolumn

" Open widnow below
set splitbelow
set splitright

" Delete file
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

" Disable session auto-save and auto-load
let g:session_autosave = 'no'
let g:session_autoload = 'no'

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" ======================================================== THOUGHTBOT DEFAULTS

set nocompatible  " Use Vim settings, rather then Vi settings
" set nobackup
" set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»»,trail:●

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Color scheme
" colorscheme vividchalk
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
