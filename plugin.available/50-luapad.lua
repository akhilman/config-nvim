local M = {}

M.name = 'luapad'

function M.packer_startup(use)
  use { 'rafcamlet/nvim-luapad' }
end

require('plugins').add(M)
