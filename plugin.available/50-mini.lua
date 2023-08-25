local function config()
  -- -- bufremove
  -- local bufremove = require 'mini.bufremove'
  -- bufremove.setup{}
  -- vim.keymap.set('n', '<Leader>q', bufremove.delete,
  --   { desc = "Remove current buffer", silent = true })

  -- pairs
  require('mini.pairs').setup {}

  -- surround
  require('mini.surround').setup {}
end

require('plugins').try_use { 'echasnovski/mini.nvim', branch = 'stable', config = config }
