--
-- https://github.com/kylechui/nvim-surround
--

local M = {}

function M.packer_startup(use)
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
end

return M
