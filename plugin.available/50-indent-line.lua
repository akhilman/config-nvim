local function config()
  local have_treesitter = packer_plugins['nvim-treesitter'] ~= nil
  require('indent_blankline').setup {
    -- for example, context is off by default, use this to turn it on
    -- these options requires treesitter
    show_current_context = have_treesitter,
    show_current_context_start = have_treesitter,
    use_treesitter = have_treesitter,
  }
end

require('packer_utils').try_use {
  'lukas-reineke/indent-blankline.nvim',
  config = config,
}

---@diagnostic disable-next-line unused-local
local test = {
  {
    {
      {
        {
          {
            {
              {

              }
            }
          }
        }
      }
    }
  }
}
