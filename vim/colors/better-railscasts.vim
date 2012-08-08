" Name:     better-railscast
" First Modifier: Oguz Bilgic <fisyonet@gmail.com>
" Second Modifier: Reda Lemeden <reda@thoughtbot.com>

" -----------------------------------------------------------------------------------
" Settings
" -----------------------------------------------------------------------------------
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "sexy-railscasts"

" -----------------------------------------------------------------------------------
" Basics
" -----------------------------------------------------------------------------------
hi Normal                    guifg=#E6E1DC guibg=#222222
hi Cursor                    guibg=#FFFFFF
hi CursorLine                guibg=#333435
hi CursorColumn              guibg=#333435
hi LineNr                    guifg=#383838 guibg=#141414
hi NonText                   guifg=#383838 guibg=#252525
hi Search                    guibg=#5A647E
hi VertSplit                 guifg=#383838 guibg=#383838
hi Visual                    guibg=#5A647E
hi Title                     guifg=#FFFFFF

" -----------------------------------------------------------------------------------
" Folds
" -----------------------------------------------------------------------------------
hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE

" -----------------------------------------------------------------------------------
" Misc
" -----------------------------------------------------------------------------------
hi Directory                 guifg=#A5C261 gui=NONE

" -----------------------------------------------------------------------------------
" Popup Menu
" -----------------------------------------------------------------------------------
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
hi PmenuSel                  guifg=#000000 guibg=#A5C261 gui=NONE
hi PMenuSbar                 guibg=#5A647E gui=NONE
hi PMenuThumb                guibg=#AAAAAA gui=NONE

" -----------------------------------------------------------------------------------
" Syntax
" -----------------------------------------------------------------------------------
hi Comment                   guifg=#BC9458 gui=italic
hi Todo                      guifg=#BC9458 guibg=NONE    gui=italic
hi Constant                  guifg=#6D9CBE
hi Define                    guifg=#CC7833
hi Delimiter                 guifg=#519F50
hi Error                     guifg=#FFFFFF guibg=#990000
hi Exception                 guifg=#CC7833 gui=NONE
hi Function                  guifg=#FFC66D gui=NONE
hi Identifier                guifg=#D0D0FF gui=NONE
hi Include                   guifg=#CC7833 gui=NONE
hi Keyword                   guifg=#CC7833
hi Macro                     guifg=#CC7833 gui=NONE
hi Number                    guifg=#A5C261
hi PreCondit                 guifg=#CC7833 gui=NONE
hi PreProc                   guifg=#CC7833 gui=NONE
hi Statement                 guifg=#CC7833 gui=NONE
hi String                    guifg=#A5C261
hi Type                      guifg=#DA4939 gui=NONE

" -----------------------------------------------------------------------------------
" Ruby
" -----------------------------------------------------------------------------------
hi erubyDelimiter            guifg=#DA4939

" -----------------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------------
hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

" -----------------------------------------------------------------------------------
" Xml
" -----------------------------------------------------------------------------------
hi xmlTag                    guifg=#CC7833
hi xmlTagName                guifg=#FFC66D
hi xmlEndTag                 guifg=#CC7833

" -----------------------------------------------------------------------------------
" Html
" -----------------------------------------------------------------------------------
hi htmlArg                   guifg=#CC7833 guibg=#222222
hi htmlLink                  guifg=#6D9CBE
hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag
