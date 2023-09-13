require('packer_bootstrap').try_use {
  "chrisgrieser/nvim-early-retirement",
  config = function()
    require("early-retirement").setup {
      -- if a buffer has been inactive for this many minutes, close it
      retirementAgeMins = 30,
      -- filetypes to ignore
      ignoredFiletypes = {},
    }
  end,
}
