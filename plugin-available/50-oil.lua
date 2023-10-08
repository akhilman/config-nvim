local function config()
  require('oil').setup {}
end

require('packer_bootstrap').use {
  'stevearc/oil.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = config,
}
