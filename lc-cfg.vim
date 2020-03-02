
"""
" LanguageClient
"""

"
" Nice list of LSP servers
" https://lsp.readthedocs.io/en/latest/
"

let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = $NVIM_RC_DIR . "/lc-settings.json"

let g:LanguageClient_hoverPreview = "Always"
let g:LanguageClient_useFloatingHover = 0

let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd'],
      \ 'elm': ['elm-language-server'],
      \ 'javascript': ['typescript-language-server', '--stdio'],
      \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
      \ 'python': ['pyls'],
      \ 'rust': ['rls'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ }
      "\ 'javascript': ['flow', 'lsp'],
      "\ 'javascript': ['typescript-language-server', '--stdio'],
      "\ 'javascript': ['javascript-typescript-stdio'],

let g:LanguageClient_rootMarkers = {
      \ 'cpp': ['CMakeLists.txt', '.git'],
      \ 'elm': ['elm.json', '.git'],
      \ 'javascript': ['package.json', '.git'],
      \ 'python': ['setup.py', 'setup.ini', '.git'],
      \ 'rust': ['Cargo.toml', '.git'],
      \ }
      "\ 'javascript': ['package.json', '.git'],

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <buffer> <silent> gr :call LanguageClient#textDocument_references()<CR>

    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  endif
endfunction

autocmd FileType * call LC_maps()


function LC_FormatDocument()
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
    execute '%! prettier --parser ' . &filetype . ' --stdin'
  elseif has_key(g:LanguageClient_serverCommands, &filetype)
    call LanguageClient#textDocument_formatting()
  endif
endfunction

nnoremap <buffer> <silent> gQ :call LC_FormatDocument()<CR>
" autocmd InsertLeave <buffer> :call LC_FormatDocument()

" let g:LanguageClient_loggingFile = '/tmp/nvim-language-client.log'
" let g:LanguageClient_serverStderr = '/tmp/nvim-language-server-stderr.log'


"""
" Shougo/neosnippet
"""
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


"""
" ncm2
"""
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
"inoremap <silent> <expr> <C-k> ncm2_neosnippet#expand_or("\<CR>", 'n')
"imap <expr><C-l>
"        \ neosnippet#expandable_or_jumpable() ?
"        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

