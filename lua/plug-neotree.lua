local M = {}

local function setup()
  vim.keymap.set('n', '<Space>\\',
    ': execute "Neotree toggle reveal dir=" . getcwd()<CR>',
    { silent = true })
end

function M.packer_startup(use)
  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = setup,
  }
end

return M
