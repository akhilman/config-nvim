-- Fancier statusline

local M = {}

local function setup()
  --Set statusbar
  require('lualine').setup {
    options = {
      theme = 'ayu_dark',
    },
    tabline = {
      lualine_a = {'tabs', 'buffers'}
    }
  }
end

function M.packer_startup(use)
  use {
    'nvim-lualine/lualine.nvim',
    config = setup,
  }
end

return M
