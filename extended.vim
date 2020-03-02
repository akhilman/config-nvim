let lsp_variant = "lc"


""
" Vundle
""
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin($NVIM_SHARE_DIR . '/plugged')

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
Plug 'ap/vim-css-color'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'  " highlight trailing whitespaces
Plug 'michaeljsmith/vim-indent-object'
Plug 'alvan/vim-closetag'  " close html tag
Plug 'euclio/vim-markdown-composer'

" syntax
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'cespare/vim-toml'
Plug 'cstrahan/vim-capnp'
Plug 'dag/vim-fish'
Plug 'dcharbon/vim-flatbuffers'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

if lsp_variant == 'ale'
  execute "source " . $NVIM_RC_DIR . "/ale-plug.vim"
elseif lsp_variant == 'lc'
  execute "source " . $NVIM_RC_DIR . "/lc-plug.vim"
elseif lsp_variant == 'coc'
  execute "source " . $NVIM_RC_DIR . "/coc-plug.vim"
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
let g:session_directory = $NVIM_CACHE_DIR . '/sessions'


"""
" Rainbow
""
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'guifgs': ['royalblue1', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']
  \ }


"""
" Closetag
""
let g:closetag_filetypes = 'html,xhtml,phtml,svg,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }

"""
" NERDTree
""
noremap <silent> <C-\> :NERDTreeToggle <CR>
let NERDTreeIgnore = [
      \ '^node_modules$'
      \ ]

"""
" Other
""

noremap <silent> <leader>t :TagbarToggle <CR>
map <leader>f <Plug>(easymotion-s)
noremap <leader>e :copen <CR>



"""
" LSP
""
if lsp_variant == 'ale'
  execute "source " . $NVIM_RC_DIR . "/ale-cfg.vim"
elseif lsp_variant == 'lc'
  execute "source " . $NVIM_RC_DIR . "/lc-cfg.vim"
elseif lsp_variant == 'coc'
  execute "source " . $NVIM_RC_DIR . "/coc-cfg.vim"
endif
