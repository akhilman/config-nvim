-- Fancier statusline
local M = {}

local function setup()
  local plugins = require 'plugins'

  local tabline = {
    lualine_a = { 'tabs', 'buffers' },
    lualine_z = {},
  }
  if plugins.is_enabled('plug-auto-session') then
    table.insert(tabline.lualine_z, require('auto-session-library').current_session_name)
  end

  --Set statusbar
  require('lualine').setup {
    options = {
      theme = 'auto',
    },
    tabline = tabline,
  }
end

function M.packer_startup(use)
  use {
    'nvim-lualine/lualine.nvim',
    config = setup,
  }
end

return M
