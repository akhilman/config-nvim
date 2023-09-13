local function config()
  vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
end

require('packer_bootstrap').use {
  'mbbill/undotree',
  config = config,
}
