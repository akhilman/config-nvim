local M = {}

function M.packer_startup(use)
  use { 'uga-rosa/ccc.nvim', config = function()
    ccc = require('ccc')
    mapping = ccc.mapping
    ccc.setup {
      mappings = {
        ['<Left>'] = mapping.decrease1,
        ['<Right>'] = mapping.increase1,
      }
    }
    vim.keymap.set('n', '<LocalLeader>c', ':CccPick<CR>',
      { silent = true, desc = "Pick color with :CccPick" })
  end }
end

return M
