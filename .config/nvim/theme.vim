"""
" airline
""
if $COLORTERM == "truecolor"
    let g:airline_powerline_fonts = 1
endif

"""
" fix for only 8 colors in screen
""
if $TERM == "screen" && $COLORTERM == "truecolor"
    let $TERM="xterm"
endif


"""
" Color scheme and gui options
""

let g:airline_theme="minimalist"

colorscheme torte
highlight Pmenu ctermfg=white ctermbg=darkgray
highlight PmenuSel ctermfg=white ctermbg=blue
highlight Visual term=reverse cterm=reverse guibg=Grey


"line number
set number
highlight LineNr ctermfg=gray guifg=gray
