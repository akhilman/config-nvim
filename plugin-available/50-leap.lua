require('packer_bootstrap').use {
  'ggandor/leap.nvim',
  config = function()
    require('leap').add_default_mappings()
  end,
}
