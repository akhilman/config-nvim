-- "gc" to comment visual regions/lines

require('packer_bootstrap').use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
