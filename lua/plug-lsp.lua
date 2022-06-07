local function setup_lsp()
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr) ---@diagnostic disable-line: unused-local

    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', require 'telescope.builtin'.lsp_definitions, bufopts)
    vim.keymap.set('n', 'gi', require 'telescope.builtin'.lsp_implementations, bufopts)
    vim.keymap.set('n', 'gr', require 'telescope.builtin'.lsp_references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>ds', require 'telescope.builtin'.lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<space>ws', require 'telescope.builtin'.lsp_workspace_symbols, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())); end, bufopts)
    vim.keymap.set('n', '<space>D', require 'telescope.builtin'.lsp_type_definitions, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  end

  -- Find rust analyzer
  local function find_rust_analyzer()
    if vim.fn.executable('rustup') then
      local cmd = vim.fn.system('rustup which --toolchain nightly rust-analyzer')
          :match('^%s*(.-rust--analyzer)%s*$')
      if cmd then return { cmd } end
    end
    if vim.fn.executalbe('rust-analyzer') then return { 'rust-analyzer' } end
    return nil
  end

  -- Per server settings
  local server_settings = {
    clangd = {},
    denols = {
      enabled = true,
      lint = true,
    },
    elmls = {},
    pylsp = {
      plugins = {
        black = { enabled = true },
        pylint = { enabled = true },
        pyflakes = { enabled = false },
        pyls_mypy = { enabled = true, live_mode = false },
        isort = { enabled = true },
      }
    },
    rust_analyzer = {
      cmd = find_rust_analyzer(),
      settings = {
        rust = { clippy_preference = true },
        ["rust-analyzer"] = {
          -- cargo = { features = nil },
          checkOnSave = {
            enabled = true,
            command = "clippy",
            -- features = nil
          },
          inlayHints = {
            enabled = true
          }
        }
      }
    },
    sumneko_lua = {},
  }

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local lspconfig = require('lspconfig')

  -- Enable language servers with the additional completion capabilities offered by nvim-cmp
  for lsp, config in pairs(server_settings) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    lspconfig[lsp].setup(config)
  end
end

-- luasnip setup
-- nvim-cmp setup

local function setup_completion()
  local luasnip = require 'luasnip'
  local cmp = require 'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

-- Plugin module
local M = {}

function M.startup(use)
  -- Completion and LSP
  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      { 'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        requires = {
          {
            'neovim/nvim-lspconfig',
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
        }
      },
      -- Snippets
      { 'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        requires = {
          'L3MON4D3/LuaSnip', -- Snippets
        }
      },
    }
  }
end

function M.setup()
  setup_completion()
  setup_lsp()
end

return M
