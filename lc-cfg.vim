
"""
" LanguageClient
"""

"
" Nice list of LSP servers
" https://lsp.readthedocs.io/en/latest/
"

let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = [
      \ ($NVIM_RC_DIR . "/lc-settings.json"),
      \ ".vim/settings.json"
      \ ]

let g:LanguageClient_hoverPreview = "Always"
let g:LanguageClient_useFloatingHover = 0
let g:LanguageClient_useVirtualText = "All"

" let g:LanguageClient_devel = 1 " Use rust debug build
" let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
" let g:LanguageClient_loggingFile = "/tmp/LanguageClient.log"


let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd'],
      \ 'elm': ['elm-language-server'],
      \ 'javascript': ['typescript-language-server', '--stdio'],
      \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
      \ 'python': ['pyls'],
      \ 'rust': ["rust-analyzer"],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ }
      "\ 'javascript': ['typescript-language-server', '--stdio'],
      "\ 'javascript': ['javascript-typescript-stdio'],


let g:LanguageClient_rootMarkers = {
      \ 'cpp': ['CMakeLists.txt', '.git'],
      \ 'elm': ['elm.json', '.git'],
      \ 'javascript': ['package.json', '.git'],
      \ 'typescript': ['package.json', '.git'],
      \ 'python': ['setup.py', 'setup.ini', '.git'],
      \ 'rust': ['Cargo.toml', '.git'],
      \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    " nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <buffer> <silent> gr :call LanguageClient#textDocument_references()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

" let g:LanguageClient_loggingFile = '/tmp/nvim-language-client.log'
" let g:LanguageClient_serverStderr = '/tmp/nvim-language-server-stderr.log'


"""
" Formatting
"""
function SetFormatPrg()
  if index([
        \ "flow",
        \ "typescript",
        \ "css",
        \ "less",
        \ "scss",
        \ "json",
        \ "json5",
        \ "markdown",
        \ "yaml",
        \ "html",
        \], &filetype) >= 0
    exec 'setlocal formatprg=prettier\ --parser\ ' . &filetype . '\ --stdin'
  elseif &filetype == "toml"
    setlocal formatprg=toml-fmt
  elseif has_key(g:LanguageClient_serverCommands, &filetype)
    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  endif
endfunction

autocmd FileType * call SetFormatPrg()

function FormatAllByFormatPrg()
  if &formatexpr =~ "LanguageClient"
    call LanguageClient#textDocument_formatting()
  else
    let currentpos=getpos('.')
    normal gggqG
    call setpos('.', currentpos)
  endif
endfunction

command Format call FormatAllByFormatPrg()
noremap <leader>b :call FormatAllByFormatPrg()<CR>

" auto format

function DoAutoFormat()
  if get(b:, 'auto_format', 0) == 1 || get(g:, 'auto_format', 0) == 1
    call FormatAllByFormatPrg()
  endif
endfunction

autocmd InsertLeave <buffer> :call DoAutoFormat()


"""
" Shougo/deoplete.nvim
""
let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
let g:deoplete#sources#jedi#show_docstring = 0
"call deoplete#custom#source('sources', {
"      \ 'cpp': ['LanguageClient'],
"      \ 'python': ['LanguageClient'],
"      \ 'rust': ['LanguageClient'],
"      \ })

call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })

inoremap <silent><expr> <C-n> deoplete#manual_complete()
"imap <expr> <C-k> pumvisible() ? deoplete#close_popup() :
"		\ neosnippet#expandable_or_jumpable() ?
"		\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"

" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function() abort
"  return deoplete#close_popup()
"endfunction


"""
" Shougo/neosnippet
"""
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

let g:neosnippet#enable_complete_done = 1  " for LanguageClient and Rust snippets
let g:neosnippet#enable_snipmate_compatibility = 1


"""
" More key bindings
""
noremap <leader>e :copen <CR>
