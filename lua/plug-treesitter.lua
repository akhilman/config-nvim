local M = {}

-- Table `language = true` for all updated languages
local updated_parsers = {}

local function buffer_setup()
  -- Setup folding method to treesitter if the parser is installled for the
  -- current buffer language
  if pcall(function()
    return vim.treesitter.language.inspect_language(vim.bo.filetype)
  end) then
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldmethod = "expr"
    -- Update parser
    if not updated_parsers[vim.bo.filetype] then
      vim.cmd(":TSUpdate " .. vim.bo.filetype)
      updated_parsers[vim.bo.filetype] = true
    end
  end
end

function M.setup()
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
    { "BufReadPost" },
    { callback = function() vim.defer_fn(buffer_setup, 1000) end }
  )

end

function M.startup(use)
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
end

return M
