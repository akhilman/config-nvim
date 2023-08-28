-- Fancier statusline

local function config()
  -- local plugins = require 'plugins'
  local try_require = require('plugins').try_require

  local tabline = {
    lualine_a = { 'tabs', 'buffers' },
    lualine_z = {},
  }
  local auto_session_lib = try_require('auto-session.lib')
  if auto_session_lib then
    table.insert(tabline.lualine_z, auto_session_lib.current_session_name)
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

require('plugins').try_use {
  'nvim-lualine/lualine.nvim',
  config = config,
}
