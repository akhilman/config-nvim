local M = {}

function M.packer_startup(use)
  use { 'metalelf0/jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' }
  }
end

return M
