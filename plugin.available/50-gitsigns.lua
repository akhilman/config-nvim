local M = {}

M.name = 'gitsigns'

local function config()
  require('gitsigns').setup {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  }
  vim.cmd [[highlight SignColumn guibg=Gray10]]
end

function M.packer_startup(use)
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = config,
  }
end

require('plugins').add(M)
