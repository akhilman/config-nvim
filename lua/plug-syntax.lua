local M = {}

function M.startup(use)
  use { 'andys8/vim-elm-syntax', { ft = 'elm' } }
  use 'cespare/vim-toml'
  use 'cstrahan/vim-capnp'
  use 'dag/vim-fish'
  use 'dcharbon/vim-flatbuffers'
  use 'djpohly/vim-execline'
  use 'gluon-lang/vim-gluon'
  use 'jonsmithers/vim-html-template-literals'
  use 'leafgarland/typescript-vim'
  use 'pangloss/vim-javascript'
  use 'teal-language/vim-teal'
end

return M
