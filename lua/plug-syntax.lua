local M = {}

function M.packer_startup(use)
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
  use { 'andys8/vim-elm-syntax', { ft = 'elm' } }
end

return M
