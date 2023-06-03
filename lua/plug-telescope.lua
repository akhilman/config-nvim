local M = {}

local function setup()
  local telescope_builtin = require 'telescope.builtin'

  -- Buffers
  vim.keymap.set('n', '<Leader>f/', telescope_builtin.current_buffer_fuzzy_find,
    { desc = 'Find in current buffer with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers,
    { desc = 'Find buffer with Telescope', silent = true })

  -- Diagnostics
  vim.keymap.set('n', '<LocalLeader>e', vim.diagnostic.open_float,
    { desc = 'Show diagnostic errors', silent = true })
  vim.keymap.set('n', '<LocalLeader>q', telescope_builtin.diagnostics,
    { desc = 'Show diagnostic errors with Telescope', silent = true })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { desc = 'Previous diagnostic error', silent = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { desc = 'Next diagnostic error', silent = true })

  -- Files
  vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files,
    { desc = 'Find file with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>fg', telescope_builtin.git_files,
    { desc = 'Find file in git with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>f/', telescope_builtin.live_grep,
    { desc = 'Search for a string and get results live as you type', silent = true })
  vim.keymap.set('n', '<Leader>f*', telescope_builtin.grep_string,
    { desc = 'Searches for the string under your cursor in your current working directory', silent = true })

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest,
    { desc = "Spell suggestions with Telescope", silent = true })

  -- Telescope history
  vim.keymap.set('n', '<Leader>fh', telescope_builtin.pickers,
    { desc = "Show recent telescope searches", silent = true })

  -- Commands
  vim.keymap.set('n', '<Leader>fc', telescope_builtin.commands,
    { desc = 'Find command with Telescope', silent = true })
  vim.api.nvim_create_user_command('SearchHelp', telescope_builtin.help_tags,
    { desc = "Search in vim's help using telescope" })
  vim.api.nvim_create_user_command('SearchKeymaps', telescope_builtin.keymaps,
    { desc = "Search keymap using telescope" })
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
