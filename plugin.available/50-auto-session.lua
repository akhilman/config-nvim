--[[
Commands:
:SaveSession " saves or creates a session in the currently set `auto_session_root_dir`.
:SaveSession ~/my/custom/path " saves or creates a session in the specified directory path.
:RestoreSession " restores a previously saved session based on the `cwd`.
:RestoreSession ~/my/custom/path " restores a previously saved session based on the provided path.
:RestoreSessionFromFile ~/session/path " restores any currently saved session
:DeleteSession " deletes a session in the currently set `auto_session_root_dir`.
:DeleteSession ~/my/custom/path " deleetes a session based on the provided path.
--]]
local auto_sesson_config = {
  auto_restore_enabled = true,
  auto_save_enabled = true,
  auto_session_create_enabled = false,
  bypass_session_save_file_types = {
    'neo-tree',
  },
}

require('packer_utils').try_use {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = "help,skiprtp,tabpages,winsize"
    require('auto-session').setup(auto_sesson_config)
  end,
}

require('packer_utils').try_use {
  'rmagatti/session-lens',
  config = function()
    vim.keymap.set('n', '<leader>fS', require('session-lens').search_session,
      { desc = 'Searches session', silent = true })
  end,
  requires = { 'rmagatti/auto-session', 'nvim-lua/plenary.nvim' },
  after = { 'auto-session' },
}
