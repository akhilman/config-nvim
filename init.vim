let $NVIM_RC_DIR = expand('<sfile>:p:h')
let $NVIM_SHARE_DIR = $HOME . '/.local/share/nvim'
let $NVIM_CACHE_DIR = $HOME . '/.cache/nvim'

let g:python3_host_prog = '/usr/bin/python3'

execute "source " . $NVIM_RC_DIR . "/basic.vim"
execute "source " . $NVIM_RC_DIR . "/localization.vim"
if $NVIM_NOT_EXTENDED == ''
\ && filereadable($NVIM_SHARE_DIR . "/site/autoload/plug.vim")
    execute "source " . $NVIM_RC_DIR . "/extended.vim"
endif
execute "source " . $NVIM_RC_DIR . "/theme.vim"
