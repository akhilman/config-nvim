local function config()
  require("nvim-tree").setup {
    update_focused_file = { enable = true }
  }
  vim.keymap.set(
    'n', '<Leader>t',
    ':NvimTreeFindFileToggle<CR>',
    {}
  -- { silent = true }
  )
end

require('packer_utils').try_use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',   -- optional, for file icons
  },
  config = config,
}
