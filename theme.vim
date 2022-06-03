"""
" fix for only 8 colors in screen
""
"if $TERM == "screen" || $TERM == "linux"
"    let $TERM="xterm"
"endif
if $COLORTERM == "truecolor"
    set termguicolors
endif

"""
" Color scheme and gui options
""
colorscheme default
set background=dark
highlight Pmenu ctermfg=white ctermbg=darkgray guifg=#aaaaaa guibg=#222222
highlight PmenuSel ctermfg=white ctermbg=blue guifg=white guibg=#194675
highlight Visual term=reverse cterm=reverse ctermbg=black guifg=#ffffff guibg=#194675
highlight Folded guibg=gray30 guifg=cyan
highlight FoldColumn guibg=darkgrey guifg=white
highlight SpellBad ctermfg=darkred
highlight VertSplit term=bold cterm=bold gui=bold ctermbg=darkgray guifg=Gray30 guibg=Gray10

set guifont=Mono\ Regular\ 12
" seems line not work in nvim-qt

"line number
set number
highlight LineNr ctermfg=gray guifg=gray

