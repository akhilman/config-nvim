-- Set color scheme

local M = {}

local function default_color_scheme()
  vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/default_colorscheme.vim')
end

function M.setup()
  if vim.env.COLORTERM == "truecolor" then
    vim.o.termguicolors = true
  end
  local theme_is_loaded = pcall(function() vim.cmd [[colorscheme nightfox]] end)
  if not theme_is_loaded then
    default_color_scheme()
  end
end

return M
