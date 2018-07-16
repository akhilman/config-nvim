""
" Vundle
""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.local/share/nvim/plugged')

" let Vundle manage Vundle, required
" Plug 'gmarik/Vundle.vim'

" stuff
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
"Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc' " required for vim-session
Plug 'xolox/vim-session'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'michaeljsmith/vim-indent-object'
Plug 'dag/vim-fish'
"Plug 'vimwiki/vimwiki'

" completion
"Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" python
Plug 'tell-k/vim-autopep8'
Plug 'fisadev/vim-isort'
Plug 'hynek/vim-python-pep8-indent'
Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/pydoc.vim'
" Plug 'davidhalter/jedi-vim'

call plug#end()            " required
filetype plugin indent on    " required


""""
"" syntastic
"""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:loaded_python_provider = 1
" let g:syntastic_python_python_exec = 'python3'
" let g:syntastic_python_pyflakes_exe = 'pyflakes3'
let g:syntastic_python_checkers=['python', 'pyflakes', 'flake8']

"""
" ctrlp
""
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_cutom_ignore = { 'dir':  '\v[\/](\.git|\.hg|\.svn|__pycache__)$', 'file': '\v\.(exe|so|dll)$' }


"""
" YouCompleteMe
"""
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_python_binary_path = 'python'


"""
" jedi-vim
"""
"let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3
" autocmd FileType python setlocal completeopt-=preview

"""
" Shougo/deoplete.nvim
""
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
""noremap <silent> <leader>G :YcmComplete GoToReferences <CR>


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
" VimWiki
""
let g:vimwiki_list = [{'path': '~/Documents/notes/', 'path_html': '~/Documents/notes.html'}]

"""
" Autopep8
""
let g:autopep8_disable_show_diff=1


"""
" keymap
""
noremap <silent> <C-\> :NERDTreeToggle <CR>
noremap <silent> <leader>t :TagbarToggle <CR>
map <leader>f <Plug>(easymotion-s)
autocmd FileType python map <buffer> <leader>b :w \| :call Autopep8()<CR>
autocmd FileType python map <leader>s :w \| :Isort <CR>
noremap <leader>e :SyntasticReset \| SyntasticCheck \| :Errors <CR>
noremap <silent> <leader>l <Plug>(Pydocstring)
"noremap <silent> <leader>g :YcmComplete GoTo <CR>
"noremap <silent> <leader>G :YcmComplete GoToReferences <CR>


"""
" stuff
"""
autocmd FileType python setlocal foldmethod=indent
" закрывает окно документации при autocompletion
" autocmd CompleteDone * pclose
