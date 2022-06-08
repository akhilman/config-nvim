local M = {}

local function setup()
  local telescope_builtin = require 'telescope.builtin'

  -- Buffers
  vim.keymap.set('n', '<leader>f/', telescope_builtin.current_buffer_fuzzy_find,
    { desc = 'Find in current buffer with Telescope', silent = true })
  vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers,
    { desc = 'Find buffer with Telescope', silent = true })

  -- Diagnostics
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float,
    { desc = 'Show diagnostic errors', silent = true })
  vim.keymap.set('n', '<space>q', telescope_builtin.diagnostics,
    { desc = 'Show diagnostic errors with Telescope', silent = true })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { desc = 'Previous diagnostic error', silent = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { desc = 'Next diagnostic error', silent = true })

  -- Files
  vim.keymap.set('n', '<C-p>', telescope_builtin.find_files,
    { desc = 'Find file with Telescope', silent = true })
  vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files,
    { desc = 'Find file with Telescope', silent = true })
  vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep,
    { desc = 'Search for a string and get results live as you type', silent = true })
  vim.keymap.set('n', '<leader>fs', telescope_builtin.grep_string,
    { desc = 'Searches for the string under your cursor in your current working directory', silent = true })

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest,
    { desc = "Spell suggestions with Telescope", silent = true })

  -- Telescope history
  vim.keymap.set('n', '<leader>fh', telescope_builtin.pickers,
    { desc = "Show recent telescope searches", silent = true })
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
