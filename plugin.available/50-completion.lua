local M = {}

M.name = 'autocompletion'

-- Setup completion
local function config()
  local plugins = require 'plugins'

  local luasnip = require 'luasnip'
  local cmp = require 'cmp'

  -- Main sources
  local sources = {
    { name = 'luasnip' },
    { name = 'path' },
  }
  -- Completion for LSP
  if plugins.contains('lsp') then
    table.insert(sources, { name = 'nvim_lsp' })
  end
  -- Completion for Dap debugger REPL terminal
  if plugins.contains('debugger') then
    table.insert(sources, { name = 'dap' })
  end

  cmp.setup {
    -- nvim-cmp by defaults disables autocomplete for prompt buffers
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or
          (plugins.contains('debugger') and
            require("cmp_dap").is_dap_buffer())
    end,
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
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = sources,
  }

  -- Like `cmp.mapping.complete` but for command line.
  local function cmd_complete(option)
    return cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete(option)
      end
    end, { 'c' })
  end

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline({
      ['<C-Space>'] = cmd_complete(),
      ['<Tab>'] = cmd_complete(),
    }),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline({
      ['<C-Space>'] = cmd_complete(),
      ['<Tab>'] = cmd_complete(),
    }),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

-- Packer startup
function M.packer_startup(use)
  -- Completion and LSP
  local plugins = require 'plugins'

  local requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    -- Snippets
    {
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      requires = {
        'L3MON4D3/LuaSnip',       -- Snippets
      }
    },
  }
  -- Language server protocol
  if plugins.contains('lsp') then
    table.insert(requires, 'hrsh7th/cmp-nvim-lsp')
  end

  if plugins.contains('debugger') then
    table.insert(requires, { 'rcarriga/cmp-dap', after = 'nvim-cmp' })
  end

  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    config = config,
    requires = requires,
  }
end

require('plugins').add(M)
