vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/localization.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/theme.vim')

-- Load and setup plugins
require 'plugins'.setup_plugins {
  'plug-auto-pairs',
  'plug-close-tag',
  'plug-comment',
  'plug-css-color',
  'plug-easy-motion',
  'plug-formatting',
  'plug-fugitive',
  'plug-gitsigns',
  'plug-indent-line',
  'plug-indent-object',
  'plug-lsp',
  'plug-lualine',
  'plug-markdown-composer',
  'plug-neotree',
  'plug-syntax',
  'plug-telescope',
  -- 'plug-nerdtree',  -- replaced with neotree
  -- 'plug-treesitter',  -- doesn't work properly
}
