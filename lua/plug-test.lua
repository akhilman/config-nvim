local M = {}

function M.packer_startup(use)
  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }
end

return M
