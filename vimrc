source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/autoload.vim
source $HOME/.vim/vimrc/commands.vim

"========================================================= VUNDLE
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" General
Bundle 'danro/rename.vim'
Bundle 'greplace.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Web Design
Bundle 'hail2u/vim-css3-syntax'
Bundle 'henrik/vim-open-url'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'myusuf3/numbers.vim'
Bundle 'nono/jquery.vim'
Bundle 'othree/html5.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'tsaleh/vim-matchit'
Bundle 'UltiSnips'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'ctrlp.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'mattn/emmet-vim'
Bundle 'dag/vim-fish'
Bundle 'justinmk/vim-sneak'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mustache/vim-mustache-handlebars'

" Scala
Bundle 'derekwyatt/vim-scala'

filetype plugin indent on

" Hide that butt-ugly toolbar
set guioptions=egmrt
set guioptions-=r

" Disable mouse
set mouse=""

" highlight Search
set hlsearch

" Look & Feel
colorscheme tomorrow-night
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
let Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'fancy'

"========================================================================== AUTOCOMMAND
autocmd BufNewFile,BufRead jquery.*.js set ft=javascript syntax=jquery
autocmd BufNewFile,BufRead *.slim set ft=slim syntax=slim
autocmd BufNewFile,BufRead *.hbs set ft=mustache syntax=mustache
autocmd BufNewFile,BufRead *.scss set ft=scss syntax=scss
autocmd BufRead *.json set ft=javascript

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css,css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" CocoaPods
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" Markdown
autocmd BufRead,BufNewFile *.md,*.markdown,*.mkdn setlocal spell filetype=ghmarkdown textwidth=80

" Indentation
autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
autocmd BufRead,BufNewFile *.css,*.scss setlocal foldmethod=marker foldmarker={,}

" Autoresize splits
autocmd VimResized * :wincmd =

"==========================================================================

" Auto refresh browser
let g:RefreshRunningBrowserDefault = 'chrome'

" Vim backups
set nobackup
set nowritebackup
set noswapfile

" Open all folds
set foldlevelstart=20

" Highlight cursor Line + Column
set cursorline
set cursorcolumn

" Open widnow below
set splitbelow
set splitright

" Vim Sneak
hi link SneakPluginTarget Search

" Autoload changed files
set autoread

" Autoscroll
set scrolloff=999

" Delete file
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

" Disable session auto-save and auto-load
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Vim-scala
let g:scala_sort_across_groups = 1

" Neocomplcache options
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_max_list = 10
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_force_overwrite_completefunc = 1

" UltiSnips options
let g:UltiSnipsExpandTrigger = '<c-z>'
let g:UltiSnipsJumpForwardTrigger = '<c-z>'
let g:UltiSnipsJumpBackwardTrigger = '<c-s>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [ 'ulti-snippets' ]

" CtrlP options
let g:ctrlp_max_height = 10
let g:ctrlp_cache_dir = '~/.vim/ctrlp-cache'
let g:ctrlp_open_multi = '2v'
let g:ctrlp_custom_ignore = { 'dir': 'tmp' }
let g:ctrlp_use_caching = 0

" Make CtrlP use ag (if it is present) for listing the files.
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Git-gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
"
" Emmet
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<c-y>'

" Ignore these files
set wildignore+=*.sw?
set wildignore+=.git,.svn
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.pyc,*.pyo,*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**,tmp/**,cache/**,vendor/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.avi,*.wmv,*.ogg,*.mp3,*.mov


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

" Use Ag instead of Grep when available
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
endif

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
" let g:html_indent_tags = 'li\|p'
