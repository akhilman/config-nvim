local M = {}

M.name = 'debugger'

-- TODO: Make running unit tests convenient.
-- TODO: Get lldb-vscode path from environment


local function setup_dap()
  local dap = require('dap')

  -- c, cpp, rust
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
  }
  dap.configurations.c = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = './',
      stopOnEntry = false,
      args = {},
    },
  }
  dap.configurations.cpp = dap.configurations.c
  -- dap.configurations.rust = dap.configurations.c  -- configused by rust-tools

  -- keymap
  vim.keymap.set('n', '<LocalLeader>db', ':DapToggleBreakpoint<CR>')
  vim.keymap.set('n', '<LocalLeader>dc', ':DapContinue<CR>')
  vim.keymap.set('n', '<LocalLeader>di', ':DapStepInto<CR>')
  vim.keymap.set('n', '<LocalLeader>do', ':DapStepOut<CR>')
  vim.keymap.set('n', '<LocalLeader>dq', ':DapTerminate<CR>')
  vim.keymap.set('n', '<LocalLeader>dr', ':DapToggleRepl<CR>')
  vim.keymap.set('n', '<LocalLeader>ds', ':DapStepOver<CR>')
end

local function setup_ui()
  local dapui = require "dapui"
  dapui.setup()

  vim.keymap.set('n', '<LocalLeader>dv', dapui.toggle,
    { desc = "Toggle debugger UI", silent = true })
end

function M.packer_startup(use)
  local plugins = require 'plugins'
  use {
    'mfussenegger/nvim-dap',
    config = setup_dap,
  }
  use {
    'mfussenegger/nvim-dap-python',
    config = function() require('dap-python').setup() end,
    requires = { "mfussenegger/nvim-dap" },
  }
  use {
    "rcarriga/nvim-dap-ui",
    config = setup_ui,
    requires = { "mfussenegger/nvim-dap" },
  }
  if plugins.contains('treesitter') then
    use {
      'theHamsta/nvim-dap-virtual-text',
      config = function() require("nvim-dap-virtual-text").setup() end,
      requires = { "mfussenegger/nvim-dap" },
    }
  end
end

require('plugins').add(M)
