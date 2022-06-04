-- Fancier statusline
local M = {}

function M.startup(use)
  use 'nvim-lualine/lualine.nvim'
end

function M.setup()
  --Set statusbar
  require('lualine').setup {
    options = {
      theme = 'ayu_dark',
    },
  }
end

return M
