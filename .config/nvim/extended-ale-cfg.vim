
"""
" ALE
"""
let g:ale_linters = {
      \ 'cpp': ['clangd', 'clangcheck'],
      \ 'javascript': ['tsserver', 'eslint'],
      \ 'python': ['pyls', 'flake8', 'pylint', 'mypy'],
      \ 'rust': ['rls'],
      \}

let common_fixers = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers = {
      \ 'cpp': common_fixers + ['clang-format',],
      \ 'css': common_fixers + ['prettier'],
      \ 'html': common_fixers + ['prettier'],
      \ 'javascript': common_fixers + ['eslint'],
      \ 'json': common_fixers + ['prettier'],
      \ 'python': common_fixers + ['isort', 'autopep8'],
      \ 'rust': common_fixers + ['rustfmt']
\}

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_clangcheck_executable = 'clang-check-7'
let g:ale_fix_on_save = 1
let g:ale_hover_to_preview = 1

function ALE_maps()
  if (index(['vim','help'], &filetype) == -1)
    nnoremap <silent> K :ALEHover <CR>
    nnoremap <silent> gd :ALEGoToDefinition <CR>
    nnoremap <silent> gr :ALEFindReferences <CR>
    nnoremap <leader>E :ALEDetail <CR>
  endif
endfunction

autocmd FileType * call ALE_maps()


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


