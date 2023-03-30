local M = {}

local plugins = require 'plugins'

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

-- Server settings
local function server_settings()
  local settings = {}

  -- clangd
  if vim.fn.executable('clangd') == 1 then
    settings.clangd = {}
  end

  -- denols
  if vim.fn.executable('deno') == 1 then
    settings.denols = {
      enabled = true,
      lint = true,
    }
  end

  -- elmls
  if vim.fn.executable('elm-language-server') == 1 then
    settings.elmls = {}
  end

  -- pylsp
  if vim.fn.executable('pylsp') == 1 then
    settings.pylsp = {
      plugins = {
        black = { enabled = true },
        pylint = { enabled = true },
        pyflakes = { enabled = false },
        pyls_mypy = { enabled = true, live_mode = false },
        isort = { enabled = true },
      }
    }
  end

  -- rust_analyzer
  local rust_analyzer = find_rust_analyzer()
  if rust_analyzer then
    settings.rust_analyzer = {
      cmd = find_rust_analyzer(),
      settings = {
        rust = { clippy_preference = true },
        ['rust-analyzer'] = {
          -- cargo = { features = nil },
          checkOnSave = {
            enabled = true,
            command = 'clippy',
            -- features = nil
          },
          inlayHints = {
            enabled = true
          }
        }
      }
    }
  end

  -- Lua
  if vim.fn.executable('lua-language-server') == 1 then
    settings.lua_ls = {}
  end

  return settings
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr) ---@diagnostic disable-line: unused-local

  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
    { desc = "Go to declaration", silent = true, buffer = bufnr })
  vim.keymap.set('n', 'gd', require 'telescope.builtin'.lsp_definitions,
    { desc = "Search for definitions", silent = true, buffer = bufnr })
  vim.keymap.set('n', 'gi', require 'telescope.builtin'.lsp_implementations,
    { desc = "Search for implementations", silent = true, buffer = bufnr })
  vim.keymap.set('n', 'gr', require 'telescope.builtin'.lsp_references,
    { desc = "Search for references", silent = true, buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover,
    { desc = "Show documentation (hover)", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    { desc = "Show signature help", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>s', require 'telescope.builtin'.lsp_document_symbols,
    { desc = "Show document symbols", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>ws', require 'telescope.builtin'.lsp_workspace_symbols,
    { desc = "Show workspace symbols", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>wa', vim.lsp.buf.add_workspace_folder,
    { desc = "Add workspace folder", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>wr', vim.lsp.buf.remove_workspace_folder,
    { desc = "Remove workspace folder", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>wl',
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())); end,
    { desc = "List workspace folders", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>D', require 'telescope.builtin'.lsp_type_definitions,
    { desc = "Search for type definitions", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>rn', vim.lsp.buf.rename,
    { desc = "Rename symbol (refactoring)", silent = true, buffer = bufnr })
  vim.keymap.set('n', '<LocalLeader>ca', vim.lsp.buf.code_action,
    { desc = "Show code actions", silent = true, buffer = bufnr })
end

-- LSP setup
function M.setup_lsp()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Add additional capabilities supported by nvim-cmp
  if plugins.is_enabled('plug-completion') then
    pcall(function()
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    end)
  end

  local lspconfig = require('lspconfig')

  -- Enable language servers with the additional completion capabilities
  for lsp, config in pairs(server_settings()) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    lspconfig[lsp].setup(config)
  end
end

-- Packer startup
function M.packer_startup(use)
  -- Completion and LSP
  use {
    'neovim/nvim-lspconfig',
    -- Somehow using setup function directly does not work
    config = function() require('plug-lsp').setup_lsp() end,
    requires = {
      -- LSP goodies
      'ii14/lsp-command', -- :Lsp command
      -- 'nvim-lua/lsp_extensions.nvim',  -- Inlay hints
      -- 'simrat39/rust-tools.nvim',
      {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
      }
    },
  }
end

return M
