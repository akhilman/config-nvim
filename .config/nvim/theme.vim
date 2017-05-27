"""
" airline
""
if ($COLORTERM == "truecolor" || has("termguicolors"))
    let g:airline_powerline_fonts = 1
endif

let g:airline_theme="minimalist"


"""
" Color scheme and gui options
""

if has("termguicolors")
    " disabling garbage in gvim
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    colorscheme torte
    " colors evening
    highlight Pmenu guibg=#000000 guifg=#999999 gui=bold
    highlight PmenuSel guibg=#0000aa guifg=#ffffff gui=bold
    set lines=30 columns=86
    set guifont=Mono\ Regular\ 12
else

    " fix for only 8 colors in screen
    if $TERM == "screen" && $COLORTERM == "truecolor"
        let $TERM="xterm"
    endif

    colorscheme torte
    highlight Pmenu ctermfg=white ctermbg=darkgray
    highlight PmenuSel ctermfg=white ctermbg=blue
    highlight Visual term=reverse cterm=reverse guibg=Grey
endif

"line number
set number
highlight LineNr ctermfg=gray guifg=gray
