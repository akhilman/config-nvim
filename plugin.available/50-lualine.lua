-- Fancier statusline

local function config()
  -- local plugins = require 'plugins'
  local can_require = require('plugins').can_require

  local tabline = {
    lualine_a = { 'tabs', 'buffers' },
    lualine_z = {},
  }
  if can_require 'auto-session' then
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

require('plugins').try_use {
  'nvim-lualine/lualine.nvim',
  config = config,
}
