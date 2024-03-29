if vim.fn.executable('cargo') == 1 then
  require('packer_bootstrap').use {
    'euclio/vim-markdown-composer',
    run = 'cargo build --release --locked',
    ft = 'markdown',
    config = function()
      vim.g.markdown_composer_autostart = false
    end,
  }
end
