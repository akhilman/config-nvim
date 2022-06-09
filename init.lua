vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/localization.vim')

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
  'plug-treesitter',

  'theme-moonfly',
  'theme-nightfox',
  'theme-molokai',
  'theme-nightfly',
  'theme-tender',
}

-- Set color scheme
do
  if vim.env.COLORTERM == "truecolor" then
    vim.o.termguicolors = true
  end
  local theme_is_loaded = pcall(function() vim.cmd [[colorscheme nightfox]] end)
  if not theme_is_loaded then
    vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/theme.vim')
  end
end
