" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Hide all the things
set guioptions=gmrt
set guioptions-=r

" Enable/Disable GUI tabs
set guioptions-=e

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

set guifont=Source\ Code\ Pro\ for\ Powerline:h13
