--  undofile - This allows you to use undos after exiting and restarting
--  This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
--  :help undo-persistence

local M = {}

local undo_dir = vim.fn.stdpath('cache') .. '/undo'

-- This is the persistent undo feature of vim :help undo-persistent
function M.setup()
  if vim.fn.exists('+undofile') then
    if vim.fn.isdirectory(undo_dir) == 0 then
      os.execute('mkdir -p ' .. undo_dir)
    end
    vim.o.undodir = undo_dir
    vim.opt.undofile = true
  end
end

return M
