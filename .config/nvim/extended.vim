let lsp_variant = "coc"

""
" Vundle
""
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'  " ctrl+p file opener
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'  " git integration
Plug 'xolox/vim-misc'  " required for vim-session
Plug 'xolox/vim-session'
Plug 'luochen1990/rainbow'  " colorize brackets
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'  " highlight trailing whitespaces
Plug 'michaeljsmith/vim-indent-object'
Plug 'alvan/vim-closetag'  " close html tag

" syntax
Plug 'dag/vim-fish'
Plug 'cstrahan/vim-capnp'
Plug 'dcharbon/vim-flatbuffers'
Plug 'cespare/vim-toml'

if lsp_variant == 'ale'
  source ~/.config/nvim/extended-ale-plug.vim
elseif lsp_variant == 'coc'
  source ~/.config/nvim/extended-coc-plug.vim
endif

call plug#end()            " required
filetype plugin indent on    " required


"""
" ctrlp
""
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_cutom_ignore = { 'dir':  '\v[\/](\.git|\.hg|\.svn|__pycache__)$', 'file': '\v\.(exe|so|dll)$' }


"""
" airline
""
if $COLORTERM == "truecolor" || has("termguicolors")
    let g:airline_powerline_fonts = 1
endif

"let g:airline_theme="minimalist"
"let g:airline_theme='dark'
let g:airline_theme="powerlineish"

let g:airline#extensions#tabline#enabled = 1
"set noshowmode
"set laststatus=2
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#whitespace#symbol = '!'


"""
" https://github.com/xolox/vim-session
""
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 'yes'
let g:session_persist_colors = 0
let sessionoptions = 'buffers,curdir,folds,help,tabpages,winpos,winsize,resize'
let g:session_directory = '~/.cache/nvim/sessions'


"""
" Rainbow
""
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'guifgs': ['royalblue1', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']
  \ }


"""
" Other
""
noremap <silent> <C-\> :NERDTreeToggle <CR>
noremap <silent> <leader>t :TagbarToggle <CR>
map <leader>f <Plug>(easymotion-s)
noremap <leader>e :lopen <CR>


"""
" LSP
""
if lsp_variant == 'ale'
  source ~/.config/nvim/extended-ale-cfg.vim
elseif lsp_variant == 'coc'
  source ~/.config/nvim/extended-coc-cfg.vim
endif
