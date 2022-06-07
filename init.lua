vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/localization.vim')
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/theme.vim')

-- Load and setup plugins

local plugins = {
  'plug-auto-pairs',
  'plug-close-tag',
  'plug-comment',
  'plug-css-color',
  'plug-easy-motion',
  'plug-formatting',
  'plug-fugitive',
  'plug-gitsigns',
  'plug-indent-line',
  'plug-indent-object',
  'plug-lsp',
  'plug-lualine',
  'plug-markdown-composer',
  'plug-nerdtree',
  'plug-packer',
  'plug-syntax',
  'plug-telescope',
  'plug-treesitter',
}

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Run packer
local have_packer, packer_or_errormsg = pcall(function()
  return require('packer')
end)
if have_packer then
  local packer = packer_or_errormsg

  -- Load plugins
  local plugin_modules = {}
  for _, modname in pairs(plugins) do
    local success, module_or_errormsg = pcall(function()
      return require(modname)
    end)
    if success then table.insert(plugin_modules, module_or_errormsg)
    else print(module_or_errormsg)
    end
  end

  -- Startup plugins
  packer.startup(function(use, use_rocks)
    for _, module in pairs(plugin_modules) do
      local success, errormsg = pcall(function()
        if module.startup then module.startup(use, use_rocks) end
      end)
      if not success then print(errormsg) end
    end
  end)

  -- Setup plugins
  for _, module in pairs(plugin_modules) do
    local success, errormsg = pcall(function()
      if module.setup then module.setup() end
    end)
    if not success then print(errormsg) end
  end
end
