local M = {}

-- Folding is broken with treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1424
-- https://github.com/neovim/neovim/issues/14977

local function buffer_setup()
  -- Setup folding method to treesitter if the parser is installled for the
  -- current buffer language
  if pcall(function()
    return vim.treesitter.language.inspect_language(vim.bo.filetype)
  end) then
    -- TODO: Use treesitter folding when issue will be fixed
    -- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    -- vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldmethod = "indent"
  end
end

function M.packer_setup()
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
  }

  vim.api.nvim_create_autocmd(
    { "BufReadPost", "FileReadPost" },
    { callback = buffer_setup }
  )

end

function M.packer_startup(use)
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plug-treesitter').packer_setup() end,
    run = ':TSUpdate',
  }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
end

return M
