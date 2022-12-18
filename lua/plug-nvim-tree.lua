local M = {}

local function setup()
  require("nvim-tree").setup{
    update_focused_file = { enable = true }
  }
  vim.keymap.set(
    'n', '<Space>\\',
    ':NvimTreeFindFileToggle<CR>',
    {}
    -- { silent = true }
  )
end

function M.packer_startup(use)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1195)
    config = setup,
  }
end

return M
