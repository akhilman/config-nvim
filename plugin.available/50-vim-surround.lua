--
-- https://github.com/tpope/vim-surround
--

local M = {}

M.name = 'vim-surround'

function M.packer_startup(use)
  use 'tpope/vim-surround'
end

require('plugins').add(M)
