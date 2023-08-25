if vim.fn.executable('cargo') == 1 then
  require('plugins').try_use {
    'euclio/vim-markdown-composer',
    run = 'cargo build --release --locked',
    ft = 'markdown',
    config = function()
      vim.g.markdown_composer_autostart = false
    end,
  }
end
