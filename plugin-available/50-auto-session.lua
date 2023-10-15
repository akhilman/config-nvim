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

require('packer_bootstrap').use {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = "curdir,help,skiprtp,tabpages,winsize"
    require('auto-session').setup(auto_sesson_config)
  end,
}

require('packer_bootstrap').use {
  'rmagatti/session-lens',
  config = function()
    vim.keymap.set('n', '<leader>fS', require('session-lens').search_session,
      { desc = 'Searches session', silent = true })
  end,
  requires = { 'rmagatti/auto-session', 'nvim-lua/plenary.nvim' },
  after = { 'auto-session' },
}

local function purge_sessions()
  local auto_session = require 'auto-session'
  local to_purge = {}
  for _, session in ipairs(auto_session.get_session_files()) do
    assert(session.display_name, "Session has no 'display_name' field")
    if session.display_name:find('^/.*') and vim.fn.isdirectory(session.display_name) == 0 then
      table.insert(to_purge, session.display_name)
    end
  end
  for _, name in ipairs(to_purge) do
    vim.notify("Purging session " .. name, vim.log.info)
    auto_session.DeleteSessionByName(name)
  end
  if #to_purge == 0 then
    vim.notify("Nothing to purge", vim.log.info)
  end
end

if pcall(function() require 'auto-session' end) then
  vim.api.nvim_create_user_command('PurgeSessions', purge_sessions,
    { desc = "Purge orphaned sessions" })
end
