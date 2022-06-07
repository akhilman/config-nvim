--
-- Closes html tags
--

local M = {}

local function setup()

  vim.g.closetag_filetypes = 'html,xhtml,phtml,svg,javascript,typescript'
  vim.g.closetag_regions = {
    ['typescript.tsx'] = 'jsxRegion,tsxRegion,litHtmlRegion',
    ['javascript.jsx'] = 'jsxRegion,litHtmlRegion',
    ['javascript'] = 'litHtmlRegion',
    ['typescript'] = 'litHtmlRegion',
  }
end

function M.packer_startup(use)
  use { 'alvan/vim-closetag', config = setup }
end

return M
