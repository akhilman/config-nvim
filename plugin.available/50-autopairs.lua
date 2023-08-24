--
-- Automaticaly close brackets
--

local M = {}

M.name = 'autopairs'

function M.packer_startup(use)
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
end

require('plugins').add(M)
