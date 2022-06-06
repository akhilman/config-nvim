local M = {}

function M.setup()
  vim.keymap.set('n', '<Leader>s', [[<Plug>(easymotion-s)]])
end

function M.startup(use)
  use 'Lokaltog/vim-easymotion'
end

return M
