local M = {}

M.name = 'indent-object'

function M.packer_startup(use)
  use 'michaeljsmith/vim-indent-object'
end

require('plugins').add(M)
