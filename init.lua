vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/localization.vim')

-- Load and setup plugins
require 'plugins'.setup_plugins {
  'plug-autopairs',
  'plug-auto-session',
  'plug-close-tag',
  'plug-comment',
  'plug-completion',
  'plug-css-color',
  'plug-debugger',
  'plug-easy-motion',
  'plug-formatting',
  'plug-fugitive',
  'plug-gitsigns',
  'plug-greplace',
  'plug-indent-line',
  'plug-indent-object',
  'plug-lsp',
  'plug-lualine',
  'plug-luapad',
  'plug-markdown-composer',
  'plug-neotree',
  'plug-syntax',
  'plug-telescope',
  'plug-test',
  'plug-treesitter',
  'plug-vim-surround',

  'theme-adwaita',
  'theme-molokai',
  'theme-moonfly',
  'theme-nightfly',
  'theme-nightfox',
  'theme-nord',
  'theme-tender',

  'conf-cd-to-workspace',
  'conf-colorscheme',
  'conf-gui',
}
