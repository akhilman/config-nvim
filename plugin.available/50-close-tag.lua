--
-- Closes html tags
--

local function config()
  vim.g.closetag_filetypes = 'html,xhtml,phtml,svg,javascript,typescript'
  vim.g.closetag_regions = {
    ['typescript.tsx'] = 'jsxRegion,tsxRegion,litHtmlRegion',
    ['javascript.jsx'] = 'jsxRegion,litHtmlRegion',
    ['javascript'] = 'litHtmlRegion',
    ['typescript'] = 'litHtmlRegion',
  }
end

require('plugins').try_use { 'alvan/vim-closetag', config = config }
