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
nnoremap <silent> <A-j> :resize -1<CR>
nnoremap <silent> <A-k> :resize +1<CR>
nnoremap <silent> <A-l> :vertical resize +1<CR>
nnoremap <silent> <A-h> :vertical resize -1<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

" undo and history
set history=500
set undolevels=1000

" Easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>
