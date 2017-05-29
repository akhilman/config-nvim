"""
" fix for only 8 colors in screen
""
if $TERM == "screen" || $TERM == "linux"
    let $TERM="xterm"
endif
if $COLORTERM == "truecolor"
    set termguicolors
endif

"""
" airline
""
if $COLORTERM == "truecolor" || has("termguicolors")
    let g:airline_powerline_fonts = 1
endif

let g:airline_theme="minimalist"


"""
" Color scheme and gui options
""
colorscheme torte
highlight Pmenu ctermfg=white ctermbg=darkgray guifg=#aaaaaa guibg=#222222
highlight PmenuSel ctermfg=white ctermbg=blue guifg=white guibg=#194675
highlight Visual term=reverse cterm=reverse guifg=#ffffff guibg=#194675
highlight Folded guibg=gray30 guifg=cyan
highlight FoldColumn guibg=darkgrey guifg=white

set guifont=Mono\ Regular\ 12
" seems line not work in nvim-qt

"line number
set number
highlight LineNr ctermfg=gray guifg=gray

