local function config()
  require("nvim-tree").setup {
    update_focused_file = { enable = true }
  }
  vim.keymap.set(
    'n', '<Space>/',
    ':NvimTreeFindFileToggle<CR>',
    {}
  -- { silent = true }
  )
end

require('plugins').try_use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',   -- optional, for file icons
  },
  config = config,
}
