local function config()
  require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- these options requires treesitter
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
  }
end

require('plugins').try_use {
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
