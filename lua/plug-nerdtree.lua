local M = {}

local function setup()
  vim.g.NERDTreeIgnore = {
    '^node_modules$',
  }
  vim.keymap.set('n', '<C-\\>', ':NERDTreeToggle <CR>')
end

function M.packer_startup(use)
  use {
    'scrooloose/nerdtree',
    config = setup
  }
end

return M
