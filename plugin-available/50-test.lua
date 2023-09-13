require('packer_bootstrap').use {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup()
  end
}
