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
  'plug-create-color-code',
  -- 'plug-css-color',  -- replaced by create-color-code
  'plug-debugger',
  'plug-easy-motion',
  'plug-formatting',
  'plug-fugitive',
  'plug-gitsigns',
  'plug-greplace',
  'plug-indent-line',
  'plug-indent-object',
  'plug-lazygit',
  'plug-lsp',
  'plug-lualine',
  'plug-luapad',
  'plug-markdown-composer',
  -- 'plug-mini',  -- surround, autopairs
  'plug-nvim-surround',
  'plug-nvim-tree',
  'plug-syntax',
  'plug-telescope',
  'plug-test',
  'plug-treesitter',
  'plug-undotree',
  -- 'plug-vim-surround',

  'theme-adwaita',
  'theme-github',
  'theme-jellybeans',
  'theme-kanagawa',
  'theme-nightfox',

  'conf-cd-to-workspace',
  'conf-colorscheme',
  'conf-gui',
}
