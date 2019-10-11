
"""
" ALE
"""
let g:ale_linters = {
\ 'cpp': ['clangd', 'clangcheck'],
\ 'javascript': ['tsserver'],
\ 'python': ['pyls', 'flake8', 'pylint', 'mypy'],
\ 'rust': ['rls'],
\}

let g:ale_fixers = {
\ 'cpp': ['remove_trailing_lines', 'trim_whitespace', 'clang-format',],
\ 'css': [ 'remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint'],
\ 'html': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
\ 'javascript': ['remove_trailing_lines', 'trim_whitespace', 'prettier', 'eslint'],
\ 'json': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['remove_trailing_lines', 'trim_whitespace', 'isort', 'autopep8'],
\ 'rust': ['remove_trailing_lines', 'trim_whitespace', 'rustfmt']
\}

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangcheck_executable = 'clang-check-7'
let g:ale_fix_on_save = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call ALEHover
  endif
endfunction

noremap <leader>E :ALEDetail <CR>

nmap <silent> gd :ALEGoToDefinition <CR>
nmap <silent> gr :ALEFindReferences <CR>


"""
" Shougo/deoplete.nvim
""

let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1
call deoplete#custom#source('sources', {
      \ '_': ['ale'],
      \ })

inoremap <silent><expr> <C-n> deoplete#manual_complete()


"""
" Shougo/neosnippet
"""
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


