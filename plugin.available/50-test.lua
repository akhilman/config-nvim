local M = {}

M.name = 'test'

function M.packer_startup(use)
  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }
end

require('plugins').add(M)
