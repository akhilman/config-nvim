"""
" ALE
"""
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'cpp': ['clangcheck'],
      \ 'python': ['flake8', 'pylint', 'mypy'],
      \}

let common_fixers = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers = {
      \ 'html': common_fixers + ['prettier'],
      \ 'javascript': common_fixers + ['eslint'],
      \ 'json': common_fixers + ['prettier'],
      \ 'css': common_fixers + ['prettier'],
      \ 'cpp': common_fixers + ['clang-format',],
      \ 'python': common_fixers + ['isort', 'autopep8'],
      \ 'rust': common_fixers + ['rustfmt']
      \}

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangcheck_executable = 'clang-check-7'
let g:ale_fix_on_save = 1
noremap <leader>E :ALEDetail <CR>


"""
" Shougo/deoplete.nvim
""
"let g:deoplete#sources={}
let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
"let g:deoplete#sources#jedi#show_docstring = 1
"call deoplete#custom#source('sources', {
"      \ 'cpp': ['LanguageClient'],
"      \ 'python': ['LanguageClient'],
"      \ 'rust': ['LanguageClient'],
"      \ })

inoremap <silent><expr> <C-n> deoplete#manual_complete()

"""
" Shougo/neosnippet
"""
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


"""
" LanguageClient
"""

let g:LanguageClient_hoverPreview = "Always"

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd-7'],
      \ 'python': ['pyls'],
      \ 'rust': ['rls'],
      \ }

let g:LanguageClient_rootMarkers = {
      \ 'javascript': ['project.json', '.git'],
      \ 'python': ['setup.py', 'setup.ini', '.git'],
      \ 'rust': ['Cargo.toml', '.git'],
      \ 'cpp': ['CMakeLists.txt', '.git'],
      \ }
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <buffer> <silent> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()


"""
" ternjs
""
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

" """
" " jedi-vim
" """
" "let g:jedi#completions_enabled = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#force_py_version = 3
" " autocmd FileType python setlocal completeopt-=preview
