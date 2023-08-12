# :ComposerStart to start server

local M = {}

function M.packer_startup(use)
  if vim.fn.executable('cargo') == 1 then
    use {
      'euclio/vim-markdown-composer',
      run = 'cargo build --release --locked',
      config = function()
        vim.g.markdown_composer_autostart = false
      end,
    }
  end
end

return M
