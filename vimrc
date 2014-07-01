source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/autoload.vim
source $HOME/.vim/vimrc/commands.vim
source $HOME/.vim/vimrc/plugins.vim

filetype plugin indent on

" Disable mouse
set mouse=""

" highlight Search
set hlsearch

" Look & Feel
colorscheme tomorrow-night

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_b = ''
let g:airline_section_y = ''

"========================================================================== AUTOCOMMAND
autocmd BufNewFile,BufRead jquery.*.js set ft=javascript syntax=jquery
autocmd BufNewFile,BufRead *.slim set ft=slim syntax=slim
autocmd BufNewFile,BufRead *.hbs set ft=mustache syntax=mustache
autocmd BufNewFile,BufRead *.scss set ft=scss syntax=scss
autocmd BufNewFile,BufRead *.svg set ft=xml syntax=svg
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
let g:RefreshRunningBrowserReturnFocus = 1

" Vim backups
set nobackup
set nowritebackup
set noswapfile

" Open all folds
set foldlevelstart=20

" Highlight cursor Line + Column
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

" Neocomplete options
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 10
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#force_overwrite_completefunc = 1

" UltiSnips options
let g:UltiSnipsExpandTrigger = '<c-z>'
let g:UltiSnipsJumpForwardTrigger = '<c-z>'
let g:UltiSnipsJumpBackwardTrigger = '<c-s>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [ 'ulti-snippets' ]
let g:UltiSnipsSnippetsDir = '~/.vim/ulti-snippets'

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

" Functions
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
