local M = {}

local function setup()
  local telescope_builtin = require 'telescope.builtin'
  local opts = { silent = true }

  -- Buffers
  vim.keymap.set('n', '<leader>f/', telescope_builtin.current_buffer_fuzzy_find, opts)
  vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, opts)

  -- Diagnostics
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>q', telescope_builtin.diagnostics, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  -- Files
  vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, opts)
  vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, opts)
  vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, opts)
  vim.keymap.set('n', '<leader>fs', telescope_builtin.grep_string, opts)

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest, opts)

  -- Telescope history
  vim.keymap.set('n', '<leader>fh', telescope_builtin.pickers, opts)
end

function M.packer_startup(use)
  use {
    'nvim-telescope/telescope.nvim',
    config = setup,
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  }
end

return M