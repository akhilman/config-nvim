local M = {}

M.name = 'fugitive'

function M.packer_startup(use)
  use 'tpope/vim-fugitive'
end

require('plugins').add(M)
