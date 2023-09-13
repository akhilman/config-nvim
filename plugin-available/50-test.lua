require('packer_bootstrap').try_use {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup()
  end
}
