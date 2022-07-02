local M = {}

function M.packer_startup(use)
  use {
    'ur4ltz/surround.nvim',
    config = function()
      require 'surround'.setup { mappings_style = 'surround' }
    end
  }
end

return M
