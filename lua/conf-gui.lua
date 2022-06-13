local M = {}

local function do_setup()
  if vim.fn.exists(':GuiFont') ~= 0 then
    vim.cmd('GuiFont Hack:h11')
  end
  if vim.fn.exists(':GuiTabline') ~= 0 then
    vim.cmd('GuiTabline 0')
  end

  if vim.fn.exists('*GuiShowContextMenu') ~= 0 then
    vim.keymap.set('n', '<RightMouse>', ':call GuiShowContextMenu()<CR>', { silent = true })
    vim.keymap.set('i', '<RightMouse>', '<Esc>:call GuiShowContextMenu()<CR>', { silent = true })
    vim.keymap.set('x', '<RightMouse>', ':call GuiShowContextMenu()<CR>gv', { silent = true })
    vim.keymap.set('s', '<RightMouse>', '<C-G>:call GuiShowContextMenu()<CR>gv', { silent = true })
  end
end

function M.setup()
  vim.api.nvim_create_autocmd({ 'UiEnter' }, { callback = do_setup })
end

return M
