--
-- Automaticaly close brackets
--

local M = {}

function M.packer_startup(use)
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
end

return M
