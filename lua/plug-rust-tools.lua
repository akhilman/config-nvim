local M = {}

-- Find rust analyzer
local function find_rust_analyzer()
  if vim.fn.executable('rustup') == 1 then
    local cmd = vim.fn.system('rustup which --toolchain nightly rust-analyzer')
        :match('^%s*(.-rust%-analyzer)%s*$')
    if cmd then return { cmd } end
  end
  if vim.fn.executable('rust-analyzer') == 1 then return { 'rust-analyzer' } end
  return nil
end

local function on_attach(client, bufnr)
  local rt = require('rust-tools')

  require('plug-lsp').lsp_on_attach(client, bufnr)

  vim.keymap.set('n', 'K', rt.hover_actions.hover_actions,
    { desc = "Show documentation and actions (hover)", silent = true, buffer = bufnr })
end

function M.setup_rust_tools()
  local rust_analyzer_cmd = find_rust_analyzer()
  if not rust_analyzer_cmd then
    return
  end

  local rt = require('rust-tools')

  rt.setup({
    server = {
      cmd = rust_analyzer_cmd,
      on_attach = on_attach,
    },
  })
end

function M.packer_startup(use)
  local plugins = require('plugins')

  if not plugins.is_enabled('plug-lsp') then
    return
  end

  use {
    'simrat39/rust-tools.nvim',
    -- Somehow using setup function directly does not work
    config = function() require('plug-rust-tools').setup_rust_tools() end,
    requires = {
      'neovim/nvim-lspconfig',
      'simrat39/rust-tools.nvim',
      -- Debugging
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    }
  }
end

return M
