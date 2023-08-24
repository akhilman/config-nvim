local M = {}

M.name = 'lazygit'

function M.packer_startup(use)
  use 'kdheepak/lazygit.nvim'
end

require('plugins').add(M)
