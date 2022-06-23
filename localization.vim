" In Insert mode CTRL-^ toggles keymap
" TODO: rewrite in lua, map to <C-Space>, add third keymap.

" Order matters
set keymap=russian-jcukenwin
set iminsert=0  " use qwerty by default
set imsearch=0  " use qwerty by default

" Spell checker

" Order matters
set spell spelllang=en_gb,ru_yo
set nospell

autocmd FileType gitcommit,html,markdown setlocal spell
