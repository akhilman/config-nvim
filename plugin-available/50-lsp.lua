local function config()
  -- Find rust analyzer
  local function find_rust_analyzer()
    if vim.fn.executable('rust-analyzer') == 1 then return 'rust-analyzer' end
    if vim.fn.executable('rustup') == 1 then
      local cmd = vim.fn.system('rustup which --toolchain nightly rust-analyzer')
          :match('^%s*(.-rust%-analyzer)%s*$')
      if cmd then return cmd end
    end
    return nil
  end

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local function on_attach(client, bufnr) ---@diagnostic disable-line: unused-local
    if not packer_plugins['cmp-mvim-lsp'] then
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end

    local function hover()
      if packer_plugins['rust-tools.nvim'] and vim.bo[bufnr].filetype == 'rust' then
        require('rust-tools').hover_actions.hover_actions()
      else
        vim.lsp.buf.hover()
      end
    end

    local function show_diagnostics()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').diagnostics()
      else
        vim.diagnostics.setqflist()
      end
    end

    local function to_definitions()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_definitions()
      else
        vim.lsp.buf.definition()
      end
    end

    local function to_implementations()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_implementations()
      else
        vim.lsp.buf.implementation()
      end
    end

    local function to_references()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_references()
      else
        vim.lsp.buf.references()
      end
    end

    local function to_type_defenitions()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_type_defenitions()
      else
        vim.lsp.buf.type_defenition()
      end
    end

    local function document_symbols()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_document_symbols()
      else
        vim.lsp.buf.document_symbol()
      end
    end

    local function workspace_symbols()
      if packer_plugins['telescope.nvim'] then
        require('telescope.builtin').lsp_workspace_symbols()
      else
        vim.lsp.buf.workspace_symbol()
      end
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    -- Go to
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
      { desc = "Go to declaration", silent = true, buffer = bufnr })
    vim.keymap.set('n', 'gd', to_definitions,
      { desc = "Search for definitions", silent = true, buffer = bufnr })
    vim.keymap.set('n', 'gi', to_implementations,
      { desc = "Search for implementations", silent = true, buffer = bufnr })
    vim.keymap.set('n', 'gr', to_references,
      { desc = "Search for references", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>D', to_type_defenitions,
      { desc = "Search for type definitions", silent = true, buffer = bufnr })

    -- Help
    vim.keymap.set('n', 'K', hover,
      { desc = "Show documentation (hover)", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
      { desc = "Show signature help", silent = true, buffer = bufnr })

    -- Symbols and workspace
    vim.keymap.set('n', '<LocalLeader>s', document_symbols,
      { desc = "Show document symbols", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>ws', workspace_symbols,
      { desc = "Show workspace symbols", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>wa', vim.lsp.buf.add_workspace_folder,
      { desc = "Add workspace folder", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>wr', vim.lsp.buf.remove_workspace_folder,
      { desc = "Remove workspace folder", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>wl',
      function() vim.print(vim.lsp.buf.list_workspace_folders()); end,
      { desc = "List workspace folders", silent = true, buffer = bufnr })

    -- Refactoring and code actions
    vim.keymap.set('n', '<LocalLeader>rn', vim.lsp.buf.rename,
      { desc = "Rename symbol (refactoring)", silent = true, buffer = bufnr })
    vim.keymap.set('n', '<LocalLeader>ca', vim.lsp.buf.code_action,
      { desc = "Show code actions", silent = true, buffer = bufnr })

    -- Diagnostics
    vim.keymap.set('n', '<LocalLeader>e', vim.diagnostic.open_float,
      { desc = 'Show diagnostic errors', silent = true })
    vim.keymap.set('n', '<LocalLeader>q', show_diagnostics,
      { desc = 'Show diagnostic errors with Telescope', silent = true })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
      { desc = 'Previous diagnostic error', silent = true })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
      { desc = 'Next diagnostic error', silent = true })
  end

  -- LSP setup
  -- vim.lsp.set_log_level("debug")

  -- Base configuration
  local base_cfg = {
    on_attach = on_attach,
  }
  -- Add additional capabilities supported by nvim-cmp
  if packer_plugins['cmp-nvim-lsp'] then
    vim.cmd 'packadd cmp-nvim-lsp'
    base_cfg.capabilities = require('cmp_nvim_lsp').default_capabilities()
  else
    base_cfg.capabilities = vim.lsp.protocol.make_client_capabilities()
  end

  local lspconfig = require 'lspconfig'

  -- clangd
  if vim.fn.executable('clangd') == 1 then
    lspconfig.clangd.setup(vim.tbl_extend('force', base_cfg, {}))
  end

  -- denols
  -- TODO: use https://github.com/sigmaSd/deno-nvim
  if vim.fn.executable('deno') == 1 then
    lspconfig.denols.setup(vim.tbl_extend('force', base_cfg, {
      settings = {
        -- https://deno.land/manual/advanced/language_server/overview
        deno = {
          enabled = true,
          lint = true,
        }
      }
    }))
  end

  -- elmls
  if vim.fn.executable('elm-language-server') == 1 then
    lspconfig.elmls.setup(vim.tbl_extend('force', base_cfg, {}))
  end

  -- pylsp
  if vim.fn.executable('pylsp') == 1 then
    lspconfig.pylsp.setup(vim.tbl_extend('force', base_cfg, {
      settings = {
        pylsp = {
          plugins = {
            black = { enabled = true },
            pylint = { enabled = true },
            pyflakes = { enabled = false },
            pyls_mypy = { enabled = true, live_mode = false },
            isort = { enabled = true },
            rope_autoimport = { enabled = true },
          }
        }
      }
    }))
  end

  -- rust_analyzer
  local rust_analyzer = find_rust_analyzer()
  if rust_analyzer then
    vim.cmd 'packadd rust-tools.nvim'
    local rt = require 'rust-tools'
    rt.setup {
      server = vim.tbl_extend('force', base_cfg, {
        cmd = { rust_analyzer },
        settings = {
          -- https://rust-analyzer.github.io/manual.html
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
      })
    }
  end

  -- Lua
  if vim.fn.executable('lua-language-server') == 1 then
    lspconfig.lua_ls.setup(vim.tbl_extend('force', base_cfg, {}))
  end
end

-- Packer startup
require('packer_bootstrap').try_use {
  'neovim/nvim-lspconfig',
  -- Somehow using setup function directly does not work
  config = config,
  requires = {
    -- LSP goodies
    'ii14/lsp-command', -- :Lsp command
    -- 'nvim-lua/lsp_extensions.nvim',  -- Inlay hints
    { 'simrat39/rust-tools.nvim', opt = true },
  },
}
