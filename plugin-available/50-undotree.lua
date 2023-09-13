local function config()
  vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
end

require('packer_utils').try_use {
  'mbbill/undotree',
  config = config,
}
