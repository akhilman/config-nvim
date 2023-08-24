-- Fancier statusline
local M = {}

M.name = 'lualine'

local function config()
  local plugins = require 'plugins'

  local tabline = {
    lualine_a = { 'tabs', 'buffers' },
    lualine_z = {},
  }
  if plugins.contains('auto-session') then
    table.insert(tabline.lualine_z, require('auto-session.lib').current_session_name)
  end

  local sections = {
    lualine_c = { { 'filename', path = 1 } }
  }

  local inactive_sections = {
    lualine_c = { { 'filename', path = 1 } }
  }
  --Set statusbar
  require('lualine').setup {
    options = {
      theme = 'auto',
    },
    tabline = tabline,
    sections = sections,
    inactive_sections = inactive_sections,
  }
end

function M.packer_startup(use)
  use {
    'nvim-lualine/lualine.nvim',
    config = config,
  }
end

require('plugins').add(M)