require('plugins').try_use {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup()
  end
}
