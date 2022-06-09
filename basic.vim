set nocompatible

syntax on
filetype plugin indent on
let c_minlines=500  " number of lines that vim goes backwards for syntax highlight
set list  " show trailing spaces and tabs
set modeline  " check vim configuration in file
set number  " show line number
set scrolloff=10  " показывать всегда 10 строк до и после курсора
set wrap linebreak breakat=\s  " wrap long lines
" set relativenumber  " relative line number at the left view edge


" This is the persistent undo feature of vim :help undo-persistent
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory(stdpath("cache") . '/undo') == 0
    exec ":silent !mkdir -p " . stdpath("cache") . " > /dev/null 2>&1"
  endif
  let &undodir = stdpath("cache") . "/undo/"
  set undofile
endif


" setting shell to bash to make all work again when started from fish
"set shell=/bin/bash

" moving indentation
vnoremap < <gv
vnoremap > >gv

" removing trailing spaces
autocmd FileType c,cpp,python,ruby,java,lua,vim,cmake,json,javascript,typescript,css,scss,sass,html,svg autocmd BufWritePre <buffer> :%s/\s\+$//e

" highlight 80 column
" autocmd FileType c,cpp,python,ruby,java,lua setlocal colorcolumn=81

" tab size
autocmd FileType vim,lua,c,cpp,cmake,json,yaml,javascript,typescript,css,scss,sass,html,svg,htmldjango setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType bash,dot,fish,sh,rust,python,dockerfile,sql,toml setlocal shiftwidth=4 tabstop=4 expandtab

" folding
"set foldmethod=indent
"autocmd FileType rust,c,cpp,json,javascript,typescript,css,scss,sass,html,svg setlocal foldmethod=syntax
"autocmd FileType python,yaml setlocal foldmethod=indent

"ставит х, убирает его, а потом ставит #, что бы вим не убирал таб перед #
"inoremap # x<BS>#

" highlight search
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" buffers
noremap <A-PageDown> :bnext<CR>
noremap <A-PageUp> :bprevious<CR>
noremap <leader><Tab> :b#<CR>
"noremap <leader>p :ls<CR>:b
"noremap <leader>q :bp<BAR> bd #<CR>
"noremap <leader>w :w<CR>

" splits
nnoremap <silent> <C-A-j> :resize -1<CR>
nnoremap <silent> <C-A-k> :resize +1<CR>
nnoremap <silent> <C-A-l> :vertical resize +1<CR>
nnoremap <silent> <C-A-h> :vertical resize -1<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Saving Files that Require Root Permission with sudo
cmap w!! %!sudo tee > /dev/null %

" undo and history
set history=500
set undolevels=1000

" Easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" autoformatting
set formatoptions=jcrqln2

" enable mouse
set mouse=nvh

" More space for messages
set cmdheight=2
