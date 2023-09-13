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

local function config_treesitter()
  -- Treesitter configuration
  -- Parsers must be installed manually via :TSInstall
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'elm',
      'fish',
      'html',
      'javascript',
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
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
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
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },
    -- playground = {
    --   enable = true,
    -- },
  }

  -- vim.api.nvim_create_autocmd(
  --   { "BufReadPost", "FileReadPost" },
  --   { callback = buffer_setup }
  -- )
end

local function config_indent_object()
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

local try_use = require('packer_bootstrap').try_use
-- Highlight, edit, and navigate code using a fast incremental parsing library
try_use {
  'nvim-treesitter/nvim-treesitter',
  config = config_treesitter,
}
-- Additional textobjects for treesitter
try_use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  after = { 'nvim-treesitter' },
}
try_use {
  'nvim-treesitter/nvim-treesitter-context',
  config = function() require 'treesitter-context'.setup {} end,
  requires = { 'nvim-treesitter/nvim-treesitter' },
}
try_use {
  'kiyoon/treesitter-indent-object.nvim',
  config = config_indent_object,
  requires = { 'nvim-treesitter/nvim-treesitter' },
}
-- Visualiration of AST for debuging and plugin development
-- try_use 'nvim-treesitter/playground'
