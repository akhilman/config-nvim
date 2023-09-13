--
-- Automaticaly close brackets
--

require('packer_bootstrap').try_use {
  'windwp/nvim-autopairs',
  config = function() require('nvim-autopairs').setup {} end
}
