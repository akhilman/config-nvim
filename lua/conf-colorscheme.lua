-- Set color scheme

local M = {}

local function default_color_scheme()
  vim.api.nvim_exec [[
"""
" Tweaked default colour scheme
""

colorscheme default
set background=dark
highlight Pmenu ctermfg=white ctermbg=darkgray guifg=#aaaaaa guibg=#222222
highlight PmenuSel ctermfg=white ctermbg=blue guifg=white guibg=#194675
highlight Visual term=reverse cterm=reverse ctermbg=black guifg=#ffffff guibg=#194675
highlight Folded guibg=gray30 guifg=cyan
highlight FoldColumn guibg=darkgrey guifg=white
highlight SpellBad cterm=undercurl
highlight VertSplit term=bold cterm=bold gui=bold ctermbg=darkgray guifg=Gray20 guibg=Gray5
highlight LineNr ctermfg=gray guifg=gray
]]
end

function M.setup()
  do
    if vim.env.COLORTERM == "truecolor" then
      vim.o.termguicolors = true
    end
    local theme_is_loaded = pcall(function() vim.cmd [[colorscheme nightfox]] end)
    if not theme_is_loaded then
      default_color_scheme()
    end
  end
end

return M
