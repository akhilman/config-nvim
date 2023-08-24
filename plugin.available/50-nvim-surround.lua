--
-- https://github.com/kylechui/nvim-surround
--

local M = {}

M.name = 'nvim-surround'

local function config()
  require("nvim-surround").setup {
    -- Configuration here, or leave empty to use defaults
  }
end

function M.packer_startup(use)
  use {
    "kylechui/nvim-surround",
    config = config,
  }
end

require('plugins').add(M)
