local function config()
  require('ibl').setup {}
end

require('packer_bootstrap').use {
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
