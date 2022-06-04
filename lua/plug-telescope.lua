local M = {}

function M.setup()
  local telescope_builtin = require 'telescope.builtin'
  local opts = { silent = true }

  -- Diagnostics
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', telescope_builtin.diagnostics, opts)

  -- Files
  vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, opts)
  vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, opts)
  vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, opts)
  vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, opts)
  vim.keymap.set('n', '<leader>ss', telescope_builtin.grep_string, opts)
end

function M.startup(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  }
end

return M
