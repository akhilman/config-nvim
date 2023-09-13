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
  vim.keymap.set('n', '<Leader>fg', telescope_builtin.git_files,
    { desc = 'Find a file in git with Telescope', silent = true })

  -- Buffer search
  vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers,
    { desc = 'Find a buffer with Telescope', silent = true })

  -- Spell suggestions
  vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest,
    { desc = "Spell suggestions with Telescope", silent = true })

  -- Telescope history
  vim.keymap.set('n', '<Leader>fh', telescope_builtin.pickers,
    { desc = "Show recent telescope searches", silent = true })

  -- Commands
  vim.keymap.set('n', '<Leader>fc', telescope_builtin.commands,
  vim.api.nvim_create_user_command('SearchHelp', telescope_builtin.help_tags,
    { desc = "Search in vim's help using telescope" })
  vim.api.nvim_create_user_command('SearchKeymaps', telescope_builtin.keymaps,
    { desc = "Search keymap using telescope" })
    { desc = 'Find a command with Telescope', silent = true })
end

require('packer_utils').try_use {
  'nvim-telescope/telescope.nvim',
  config = config,
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
}
