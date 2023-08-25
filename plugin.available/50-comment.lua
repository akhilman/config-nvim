-- "gc" to comment visual regions/lines

require('plugins').try_use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
