"set shell=bash\ -l

syntax on
filetype plugin indent on
let c_minlines=500  " number of lines that vim goes backwards for syntax highlight
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set wrap nolist linebreak breakat=\ 
set modeline
set backspace=2
set scrolloff=10 " показывать всегда 10 строк до и после курсора
set shada="NONE"  " workaround ошибки в федоре по поводу битых ShaDa
                  " с этой штукой вим не будет помнить предыдущее положение
                  " курсора


" This is the persistent undo feature of vim :help undo-persistent
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.cache/nvim/undo') == 0
    :silent !mkdir -p ~/.cache/nvim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo/
  set undodir+=~/.cache/nvim/undo/
  set undofile
endif


" setting shell to bash to make all work again when started from fish
set shell=/bin/bash

" moving indentation
vnoremap < <gv
vnoremap > >gv

" removing trailing spaces
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

"ставит х, убирает его, а потом ставит #, что бы вим не убирал таб перед #
inoremap # x<BS>#

" highlight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" highlight 80 column
autocmd FileType c,cpp,python,ruby,java set colorcolumn=80

" paste from X clipboard
set pastetoggle=<F2>

"highlight SpellBad ctermfg=White
"map \z :setlocal spell spelllang=

" buffers
noremap <C-Tab> :bnext<CR>
noremap <leader>] :bnext<CR>
noremap <leader>[ :bprevious<CR>
noremap <leader>q :bp<BAR> bd #<CR>
noremap <leader>p :ls<CR>:b
noremap <leader><Tab> :b#<CR>
noremap <leader>w :w<CR>

" splits
nnoremap <silent> <C-A-j> :resize -1<CR>
nnoremap <silent> <C-A-k> :resize +1<CR>
nnoremap <silent> <C-A-l> :vertical resize +1<CR>
nnoremap <silent> <C-A-h> :vertical resize -1<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

" undo and history
set history=500
set undolevels=1000

" Easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>
