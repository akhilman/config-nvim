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

local M = {}

local function setup()
  vim.o.sessionoptions = "help,skiprtp,tabpages,winsize"
  require('auto-session').setup {
    auto_restore_enabled = false,
    auto_save_enabled = true,
    auto_session_create_enabled = false,
    bypass_session_save_file_types = {
      'neo-tree',
    },
  }
end

function M.packer_startup(use)
  use {
    'rmagatti/auto-session',
    config = setup,
  }
end

return M