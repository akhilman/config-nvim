local M = {}

local function do_setup()
  if vim.fn.exists(':GuiFont') ~= 0 then
    vim.cmd('GuiFont Hack:h11')
  end
  if vim.fn.exists(':GuiTabline') ~= 0 then
    vim.cmd('GuiTabline 0')
  end
end

function M.setup()
  vim.api.nvim_create_autocmd({ 'UiEnter' }, { callback = do_setup })
end

return M
