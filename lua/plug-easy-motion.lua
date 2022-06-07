local M = {}

local function setup()
  vim.keymap.set('n', '<Leader>s', [[<Plug>(easymotion-s)]])
end

function M.packer_startup(use)
  use { 'Lokaltog/vim-easymotion', config = setup }
end

return M
