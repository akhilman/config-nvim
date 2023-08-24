local M = {}

M.name = 'leap'

function M.packer_startup(use)
  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  }
end

require('plugins').add(M)
