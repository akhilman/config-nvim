local M = {}

local plugins = require 'plugins'

-- Setup completion
function M.packer_setup()
  local luasnip = require 'luasnip'
  local cmp = require 'cmp'

  -- Main sources
  local sources = {
    { name = 'luasnip' },
    { name = 'path' },
  }
  -- Completion for LSP
  if plugins.is_enabled('plug-lsp') then
    table.insert(sources, { name = 'nvim_lsp' })
  end
  -- Completion for Dap debugger REPL terminal
  if plugins.is_enabled('plug-debugger') then
    table.insert(sources, { name = 'dap' })
  end

  cmp.setup {
    -- nvim-cmp by defaults disables autocomplete for prompt buffers
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or
          (plugins.is_enabled('plug-debugger') and
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
    sources = sources,
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

-- Packer startup
function M.packer_startup(use)
  -- Completion and LSP

  local requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    -- Snippets
    { 'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      requires = {
        'L3MON4D3/LuaSnip', -- Snippets
      }
    },
  }
  -- Language server protocol
  if plugins.is_enabled('plug-lsp') then
    table.insert(requires, 'hrsh7th/cmp-nvim-lsp')
  end

  if plugins.is_enabled('plug-debugger') then
    table.insert(requires, 'rcarriga/cmp-dap')
  end

  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    config = function() require('plug-completion').packer_setup() end,
    requires = requires,
  }
end

return M