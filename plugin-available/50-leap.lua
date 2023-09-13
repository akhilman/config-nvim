require('packer_bootstrap').try_use {
  'ggandor/leap.nvim',
  config = function()
    require('leap').add_default_mappings()
  end,
}
