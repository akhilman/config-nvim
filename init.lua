vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/localization.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/default_colorscheme.vim')

-- Initialize packer
require('packer_bootstrap').init()
-- Plugins will be loaded by plugin/*

-- GUI configuration

local font = 'Hack:h11'

local function setup_nvim_qt()
  if vim.fn.exists(':GuiFont') ~= 0 then
    vim.cmd('GuiFont ' .. font)
  end
  if vim.fn.exists(':GuiTabline') ~= 0 then
    vim.cmd('GuiTabline 0')
  end

  if vim.fn.exists('*GuiShowContextMenu') ~= 0 then
    vim.keymap.set('n', '<RightMouse>', ':call GuiShowContextMenu()<CR>', { silent = true })
    vim.keymap.set('i', '<RightMouse>', '<Esc>:call GuiShowContextMenu()<CR>', { silent = true })
    vim.keymap.set('x', '<RightMouse>', ':call GuiShowContextMenu()<CR>gv', { silent = true })
    vim.keymap.set('s', '<RightMouse>', '<C-G>:call GuiShowContextMenu()<CR>gv', { silent = true })
  end
end

-- Neovide
vim.opt_global.guifont = font

-- Neovim-qt
vim.api.nvim_create_autocmd({ 'UiEnter' }, { callback = setup_nvim_qt })
