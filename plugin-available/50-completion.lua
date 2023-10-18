-- Setup completion
local function config()
  local luasnip = require 'luasnip'
  local cmp = require 'cmp'

  -- Main sources
  local sources = {
    { name = 'calc',     priority = 150 },
    { name = 'luasnip',  priority = 100 },
    { name = 'nvim_lua', priority = 50 },
    { name = 'path',     priority = 10 },
    { name = 'buffer',   priority = 0 },
  }

  -- Completion for LSP
  if packer_plugins['nvim-lspconfig'] then
    vim.cmd 'packadd cmp-nvim-lsp'
    vim.cmd 'packadd cmp-nvim-lsp-signature-help'
    table.insert(sources, { name = 'nvim_lsp', priority = 50 })
    table.insert(sources, { name = 'nvim_lsp_signature_help', priority = 100 })
  end

  -- Completion for Dap debugger REPL terminal
  if packer_plugins['nvim-dap'] then
    vim.cmd 'packadd cmp-dap'
    table.insert(sources, { name = 'dap', priority = 50 })
  end

  cmp.setup {
    -- nvim-cmp by defaults disables autocomplete for prompt buffers
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or
          (packer_plugins['cmp-dap'] and
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
      ['<Esc>'] = cmp.mapping.abort(),
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

require('packer_bootstrap').use {
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  config = config,
  requires = {
    -- See https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources for more sources
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',     -- Maybe replace by FelipeLema/cmp-async-path
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-nvim-lua', -- Neovim Lua API
    -- Snippets
    {
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      requires = {
        'L3MON4D3/LuaSnip',       -- Snippets
      }
    },
    { 'hrsh7th/cmp-nvim-lsp',                opt = true },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', opt = true },
    { 'rcarriga/cmp-dap',                    opt = true },
  },
}
