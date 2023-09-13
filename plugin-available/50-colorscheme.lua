-- Set color scheme

if vim.env.COLORTERM == "truecolor" then
  vim.o.termguicolors = true
end
-- pcall(function() vim.cmd 'colorscheme carbonfox' end)

local try_use = require('packer_bootstrap').try_use
try_use {
  'EdenEast/nightfox.nvim',
  config = function() vim.cmd 'colorscheme carbonfox' end
}

try_use 'Mofiqul/adwaita.nvim'
try_use 'projekt0n/github-nvim-theme'
try_use { 'metalelf0/jellybeans-nvim',
  requires = { 'rktjmp/lush.nvim' }
}
try_use 'rebelot/kanagawa.nvim'
try_use 'olimorris/onedarkpro.nvim'
