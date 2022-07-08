--
-- https://github.com/kylechui/nvim-surround
--

local M = {}

local function setup()
  require("nvim-surround").setup {
    -- Configuration here, or leave empty to use defaults
  }
end

function M.packer_startup(use)
  use {
    "kylechui/nvim-surround",
    config = setup,
  }
end

return M
