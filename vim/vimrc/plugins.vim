set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Syntax
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'dag/vim-fish'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kaishin/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/syntastic'
Plugin 'othree/xml.vim'
Plugin 'vim-scripts/svg.vim'

" File System
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/nerdtree'

" Integration
Plugin 'henrik/vim-open-url'
Plugin 'mkitt/browser-refresh.vim'
Plugin 'tpope/vim-fugitive'

" Type less
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'UltiSnips'
Plugin 'mattn/emmet-vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'vim-scripts/matchit.zip'
Plugin 'xolox/vim-session'

" Search
Plugin 'ctrlp.vim'
Plugin 'greplace.vim'
Plugin 'rking/ag.vim'

" Pimp my vim
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'xolox/vim-misc'

call vundle#end()
