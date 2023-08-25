--
-- Automaticaly close brackets
--

require('plugins').try_use {
  'windwp/nvim-autopairs',
  config = function() require('nvim-autopairs').setup {} end
}
