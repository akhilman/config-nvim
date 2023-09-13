-- Set color scheme

if vim.env.COLORTERM == "truecolor" then
  vim.o.termguicolors = true
end
-- pcall(function() vim.cmd 'colorscheme carbonfox' end)

local use = require('packer_bootstrap').use
use {
  'EdenEast/nightfox.nvim',
  config = function() vim.cmd 'colorscheme carbonfox' end
}

use 'Mofiqul/adwaita.nvim'
use 'projekt0n/github-nvim-theme'
use { 'metalelf0/jellybeans-nvim',
  requires = { 'rktjmp/lush.nvim' }
}
use 'rebelot/kanagawa.nvim'
use 'olimorris/onedarkpro.nvim'
