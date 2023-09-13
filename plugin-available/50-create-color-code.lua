require('packer_bootstrap').try_use { 'uga-rosa/ccc.nvim', config = function()
  local ccc = require('ccc')
  local mapping = ccc.mapping
  ccc.setup {
    mappings = {
      ['<Left>'] = mapping.decrease1,
      ['<Right>'] = mapping.increase1,
    }
  }
  vim.keymap.set('n', '<LocalLeader>c', ':CccPick<CR>',
    { silent = true, desc = "Pick color with :CccPick" })
end }
