local M = {}

function M.packer_startup(use)

  if vim.fn.executable('cargo') == 1 then
    use {
      'euclio/vim-markdown-composer',
      run = 'cargo build --release --locked'
    }
  end
end

return M
