local M = {}

local function setup()
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
    config = setup,
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

return M
