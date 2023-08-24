-- Set color scheme

local M = {}

M.name = 'colorscheme'

function M.setup()
  if vim.env.COLORTERM == "truecolor" then
    vim.o.termguicolors = true
  end
  pcall(function() vim.cmd 'colorscheme carbonfox' end)
end

function M.packer_startup(use)
  use 'Mofiqul/adwaita.nvim'
  use 'projekt0n/github-nvim-theme'
  use { 'metalelf0/jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' }
  }
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
end

require 'plugins'.add(M)
