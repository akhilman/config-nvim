local function config()
  local telescope_builtin = require 'telescope.builtin'

  -- Word search
  vim.keymap.set('n', '<Leader>/', telescope_builtin.current_buffer_fuzzy_find,
    { desc = 'Find in current buffer (Telescope)', silent = true })
  vim.keymap.set('n', '<Leader>fs', telescope_builtin.live_grep,
    { desc = 'Search for a string and get results live as you type (Telescope)', silent = true })
  vim.keymap.set('n', '<Leader>f*', telescope_builtin.grep_string,
    { desc = 'Search for the string under your cursor (Telescope)', silent = true })

  -- File search
  vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files,
    { desc = 'Find a file (Telescope)', silent = true })
  vim.keymap.set('n', '<Leader>fr', telescope_builtin.oldfiles,
    { desc = 'Show a recently opened files (Telescope)', silent = true })
  vim.keymap.set('n', '<Leader>fg', telescope_builtin.git_files,
    { desc = 'Find a file in git (Telescope)', silent = true })

  -- Buffer search
  vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers,
    { desc = 'Find a buffer (Telescope)', silent = true })

  -- Jump list, location list and marks
  vim.keymap.set('n', '<Leader>j', telescope_builtin.jumplist,
    { desc = "Show jump list (Telescope)", silent = true })
  vim.keymap.set('n', '<Leader>l', telescope_builtin.loclist,
    { desc = "Show location list (Telescope)", silent = true })
  vim.keymap.set('n', '<Leader>`', telescope_builtin.marks,
    { desc = "Show marks (Telescope)", silent = true })

  -- Regirters
  vim.keymap.set('n', '<Leader>"', telescope_builtin.registers,
    { desc = "Show registers (Telescope)", silent = true })

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest,
    { desc = "Spell suggestions (Telescope)", silent = true })

  -- Commands
  vim.keymap.set('n', '<Leader>:', telescope_builtin.commands,
    { desc = 'Find a command (Telescope)', silent = true })

  -- Telescope history
  vim.keymap.set('n', '<Leader>fh', telescope_builtin.pickers,
    { desc = "Show recent Telescope searches", silent = true })
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
