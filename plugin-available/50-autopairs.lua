--
-- Automaticaly close brackets
--

require('packer_utils').try_use {
  'windwp/nvim-autopairs',
  config = function() require('nvim-autopairs').setup {} end
}
