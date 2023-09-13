--
-- Automaticaly close brackets
--

require('packer_bootstrap').use {
  'windwp/nvim-autopairs',
  config = function() require('nvim-autopairs').setup {} end
}
