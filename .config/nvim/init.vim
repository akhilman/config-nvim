let g:python3_host_prog = '/usr/bin/python3'

source ~/.config/nvim/basic.vim
source ~/.config/nvim/ruskeyremap.vim
if $NVIM_NOT_EXTENDED == '' 
\ && filereadable($HOME . "/.local/share/nvim/site/autoload/plug.vim")
    source ~/.config/nvim/extended.vim
endif
source ~/.config/nvim/theme.vim
