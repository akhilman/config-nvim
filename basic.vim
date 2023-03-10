" This config file is compatible with Vim and can be used as
"   source ~/.config/nvim/basic.vim
" form ~/.vimrc

set nocompatible

syntax on
filetype plugin indent on
let c_minlines=500  " number of lines that vim goes backwards for syntax highlight
set cursorline  " highlight the line under the cursor
set list  " show trailing spaces and tabs
set modeline  " check vim configuration in file
set number  " show line number
set scrolloff=5  " показывать всегда 5 строк до и после курсора
set wrap linebreak breakat=\s  " wrap long lines
set relativenumber  " relative line number at the left view edge
set timeoutlen=1500  " timeout for key chain

" This is the persistent undo feature of vim :help undo-persistent
if exists("+undofile")
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
autocmd FileType vim,lua,c,cpp,cmake,json,yaml,javascript,typescript,css,scss,sass,html,svg,htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType fish,sh,rust,python,dockerfile,sql,toml,markdown setlocal shiftwidth=4 tabstop=4

" expand tabs
autocmd FileType c,cpp,vim,lua,htmldjango,rust,python,json,javascript,typescript,css,scss,sass,html,svg setlocal expandtab

" folding
set foldmethod=indent
"autocmd FileType rust,c,cpp,json,javascript,typescript,css,scss,sass,html,svg setlocal foldmethod=syntax
"autocmd FileType python,yaml setlocal foldmethod=indent

" highlight search
set hlsearch
nnoremap <silent> <Esc>/ :nohlsearch<CR>

" live search while typing
set incsearch

" buffers
noremap <A-PageDown> :bnext<CR>
noremap <A-PageUp> :bprevious<CR>
noremap <leader><Tab> :b#<CR>
noremap <C-q> :bp<BAR> bd #<CR>
noremap <C-s> :w<CR>

" splits
nnoremap <A-Up> <C-w>k
nnoremap <A-Down> <C-w>j
nnoremap <A-Left> <C-w>h
nnoremap <A-Right> <C-w>l
nnoremap <A-S-Up> <C-w><S-k>
nnoremap <A-S-Down> <C-w><S-j>
nnoremap <A-S-Left> <C-w><S-h>
nnoremap <A-S-Right> <C-w><S-l>
nnoremap <silent> <A-C-Up> :resize +10<CR>
nnoremap <silent> <A-C-Down> :resize -10<CR>
nnoremap <silent> <A-C-Right> :vertical resize +10<CR>
nnoremap <silent> <A-C-Left> :vertical resize -10<CR>

" switch tabs
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt

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
