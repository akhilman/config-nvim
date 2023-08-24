local M = {}

M.name = 'css-color'

function M.packer_startup(use)
  use 'ap/vim-css-color'
end

require('plugins').add(M)
