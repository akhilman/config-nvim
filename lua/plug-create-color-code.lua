local M = {}

function M.packer_startup(use)
  use { 'uga-rosa/ccc.nvim', config = function()
    require('ccc').setup {}
  end }
end

return M
