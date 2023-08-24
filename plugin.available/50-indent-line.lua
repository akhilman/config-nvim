local M = {}

M.name = 'indent-line'

local function confug()
  require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- these options requires treesitter
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
  }
end

function M.packer_startup(use)
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = confug,
  }
end

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

require('plugins').add(M)
