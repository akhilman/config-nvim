local M = {}

local function setup()
  vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
end

function M.packer_startup(use)
  use {
    'mbbill/undotree',
    config = setup,
  }
end

return M
