-- Set color scheme

if vim.env.COLORTERM == 'truecolor' then
  vim.o.termguicolors = true
end

local use = require('packer_bootstrap').use

use {
  'EdenEast/nightfox.nvim',
  config = function() vim.cmd.colorscheme 'carbonfox' end
}

use {
  'projekt0n/github-nvim-theme',
  -- config = function() vim.cmd.colorscheme 'github_dark_tritanopia' end
}

use {
  'rebelot/kanagawa.nvim',
  -- config = function() vim.cmd.colorscheme 'kanagawa' end,
  -- config = function() vim.cmd.colorscheme 'kanagawa-dragon' end,
}
