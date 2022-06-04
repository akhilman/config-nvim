local M = {}

function M.startup(use)

  if vim.fn.executable('cargo') then
    use {
      'euclio/vim-markdown-composer',
      run = 'cargo build --release --locked'
    }
  end
end

return M
