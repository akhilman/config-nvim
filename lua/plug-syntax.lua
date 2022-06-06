local M = {}

function M.startup(use)
  use 'cstrahan/vim-capnp'
  use 'dcharbon/vim-flatbuffers'
  use 'djpohly/vim-execline'
  use 'gluon-lang/vim-gluon'
  use 'teal-language/vim-teal'
  -- We are using Treesitter for syntax highlight
  -- use 'cespare/vim-toml'
  -- use 'dag/vim-fish'
  -- use 'jonsmithers/vim-html-template-literals'
  -- use 'leafgarland/typescript-vim'
  -- use 'pangloss/vim-javascript'
  -- use { 'andys8/vim-elm-syntax', { ft = 'elm' } }
end

return M
