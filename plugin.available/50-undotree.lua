local M = {}

M.name = 'undotree'

local function config()
  vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
end

function M.packer_startup(use)
  use {
    'mbbill/undotree',
    config = config,
  }
end

require('plugins').add(M)
