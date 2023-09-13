--
-- https://github.com/kylechui/nvim-surround
--

local function config()
  require("nvim-surround").setup {
    -- Configuration here, or leave empty to use defaults
  }
end

require('packer_bootstrap').try_use {
  "kylechui/nvim-surround",
  config = config,
}
