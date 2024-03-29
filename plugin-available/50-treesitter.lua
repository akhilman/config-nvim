-- Folding is broken with treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1424
-- https://github.com/neovim/neovim/issues/14977
-- TODO: Use syntax folding when above issues will be solved

-- local function buffer_setup()
--   -- Setup folding method to treesitter if the parser is installled for the
--   -- current buffer language
--   if pcall(function()
--     return vim.treesitter.language.inspect_language(vim.bo.filetype)
--   end) then
--     -- TODO: Use treesitter folding when issue will be fixed
--     -- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
--     -- vim.opt_local.foldmethod = "expr"
--     vim.opt_local.foldmethod = "indent"
--   end
-- end

local function treesitter_config()
  -- Treesitter configuration
  -- Parsers must be installed manually via :TSInstall
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'c',
      'capnp',
      'cpp',
      'elm',
      'fish',
      'html',
      'htmldjango',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'markdown',
      'python',
      'rust',
      'toml',
      'typescript',
    },
    highlight = {
      enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<LocalLeader>v',
        node_incremental = '+',
        -- scope_incremental = '+',
        node_decremental = '-',
      },
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']a'] = '@parameter.outer',
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_next_end = {
          [']A'] = '@parameter.outer',
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
        },
        goto_previous_start = {
          ['[a'] = '@parameter.outer',
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_previous_end = {
          ['[A'] = '@parameter.outer',
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<LocalLeader>n'] = '@parameter.inner',
        },
        swap_previous = {
          ['<LocalLeader>p'] = '@parameter.inner',
        },
      },
    },
    -- playground = {
    --   enable = true,
    -- },
  }
end

local function treesitter_post_hook()
  if vim.fn.exists(':TSUpdate') > 0 then
    vim.cmd('TSUpdate')
  end
end

local function indent_object_config()
  require('treesitter_indent_object').setup {}

  vim.keymap.set({ "x", "o" }, "ai",
    function() require('treesitter_indent_object.textobj').select_indent_outer() end,
    { desc = "select context-aware indent" })
  vim.keymap.set({ "x", "o" }, "aI",
    function() require('treesitter_indent_object.textobj').select_indent_outer(true) end,
    { desc = "ensure selecting entire line (or just use Vai)" })
  vim.keymap.set({ "x", "o" }, "ii",
    function() require('treesitter_indent_object.textobj').select_indent_inner() end,
    { desc = "select inner block (only if block, only else block, etc.)" })
  vim.keymap.set({ "x", "o" }, "iI",
    function() require('treesitter_indent_object').textobj.select_indent_inner(true) end,
    { desc = "select entire inner range (including if, else, etc.)" })
end

local use = require('packer_bootstrap').use
-- Highlight, edit, and navigate code using a fast incremental parsing library
use {
  'nvim-treesitter/nvim-treesitter',
  config = treesitter_config,
  run = treesitter_post_hook,
}
use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  after = { 'nvim-treesitter' },
}
use {
  'nvim-treesitter/nvim-treesitter-context',
  config = function() require 'treesitter-context'.setup {} end,
  requires = { 'nvim-treesitter/nvim-treesitter' },
}
use {
  'kiyoon/treesitter-indent-object.nvim',
  config = indent_object_config,
  requires = { 'nvim-treesitter/nvim-treesitter' },
}
-- Visualiration of AST for debuging and plugin development
-- use 'nvim-treesitter/playground'
