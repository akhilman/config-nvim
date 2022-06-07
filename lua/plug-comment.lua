-- "gc" to comment visual regions/lines

local M = {}

function M.packer_startup(use)
  use {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    config = function()
      require('Comment').setup()
    end
  }
end

return M
