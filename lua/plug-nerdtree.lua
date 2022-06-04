local M = {}

function M.startup(use)
  use 'scrooloose/nerdtree'
end

function M.setup()
  vim.g.NERDTreeIgnore = {
    '^node_modules$',
  }
  vim.keymap.set('n', '<C-\\>', ':NERDTreeToggle <CR>')
end

return M
