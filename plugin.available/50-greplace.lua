local M = {}

M.name = 'greplace'

function M.packer_startup(use)
  use 'skwp/greplace.vim'
end

require('plugins').add(M)
