-- "gc" to comment visual regions/lines

require('packer_utils').try_use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
