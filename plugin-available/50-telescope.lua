local function config()
  local telescope_builtin = require 'telescope.builtin'

  -- Word search
  vim.keymap.set('n', '<Leader>/', telescope_builtin.current_buffer_fuzzy_find,
    { desc = 'Find in current buffer with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>fw', telescope_builtin.live_grep,
    { desc = 'Search for a string and get results live as you type', silent = true })
  vim.keymap.set('n', '<Leader>f*', telescope_builtin.grep_string,
    { desc = 'Searches for the string under your cursor in your current working directory', silent = true })

  -- File search
  vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files,
    { desc = 'Find a file with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>fr', telescope_builtin.oldfiles,
    { desc = 'Find a recently opened file with Telescope', silent = true })
  vim.keymap.set('n', '<Leader>fg', telescope_builtin.git_files,
    { desc = 'Find a file in git with Telescope', silent = true })

  -- Buffer search
  vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers,
    { desc = 'Find a buffer with Telescope', silent = true })

  -- Jump list, location list and marks
  vim.keymap.set('n', '<Leader>j', telescope_builtin.jumplist,
    { desc = "Show jump list in Telescope", silent = true })
  vim.keymap.set('n', '<Leader>l', telescope_builtin.loclist,
    { desc = "Show locatioh list in Telescope", silent = true })
  vim.keymap.set('n', '<Leader>m', telescope_builtin.marks,
    { desc = "Show marks in Telescope", silent = true })

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest,
    { desc = "Spell suggestions with Telescope", silent = true })

  -- Telescope history
  vim.keymap.set('n', '<Leader>fh', telescope_builtin.pickers,
    { desc = "Show recent telescope searches", silent = true })

  -- Commands
  vim.keymap.set('n', '<Leader>fc', telescope_builtin.commands,
    { desc = 'Find a command with Telescope', silent = true })
end

require('packer_bootstrap').use {
  'nvim-telescope/telescope.nvim',
  config = config,
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
}
