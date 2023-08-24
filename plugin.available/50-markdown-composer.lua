-- :ComposerStart to start server

local M = {}

M.name = 'markdown-composer'

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

require('plugins').add(M)
