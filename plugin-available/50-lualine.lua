-- Fancier statusline

local function config()
  -- local plugins = require 'packer_utils'
  local tabline = {
    lualine_a = { 'tabs', 'buffers' },
    lualine_z = {},
  }
  if packer_plugins['auto-session'] then
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

require('packer_utils').try_use {
  'nvim-lualine/lualine.nvim',
  config = config,
}
