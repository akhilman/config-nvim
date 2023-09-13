require('packer_utils').try_use {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup()
  end
}
