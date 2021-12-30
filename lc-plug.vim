Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

if executable('cargo')
  let InstallLanguageClientCommand = "make release"
else
  let InstallLanguageClientCommand = "bash install.sh"
endif

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': InstallLanguageClientCommand,
    \ }
