local M = {}

local packages_path = vim.fn.stdpath('data') .. '/site/pack/packer/'
local install_path = packages_path .. 'start/packer.nvim'
local compiled_path = vim.fn.stdpath('config') .. '/plugin/00-packer_compiled.lua'
local packer_name = 'wbthomason/packer.nvim'
local packer_repo = 'https://github.com/' .. packer_name

local plugin_modules = {}

function M.add(module)
  if not module.name then
    error("Table has no `name` field")
  end
  plugin_modules[module.name] = module
end

local function is_packer_installed()
  local success, _ = pcall(function() require 'packer' end)
  return success
end

-- Startup plugins
local function run_startup(use, use_rocks)
  for _, module in pairs(plugin_modules) do
    local success, errormsg = pcall(function()
      if module.packer_startup then module.packer_startup(use, use_rocks) end
    end)
    if not success then
      vim.notify("Failed to run `" .. module.name .. "` .packer_startup() function", vim.log.levels.ERROR)
      vim.notify(errormsg, vim.log.levels.ERROR)
    end
  end
end

-- Setup plugins
local function run_setup()
  for _, module in pairs(plugin_modules) do
    local success, errormsg = pcall(function()
      if module.setup then module.setup() end
    end)
    if not success then
      vim.notify("Failed to run `" .. module.name .. "` .setup() function", vim.log.levels.ERROR)
      vim.notify(errormsg, vim.log.levels.ERROR)
    end
  end
end

local function remove_compiled_cache()
  vim.fn.delete(compiled_path)
end

function M.bootstrap()
  if is_packer_installed() then
    vim.notify('Packer already installed', vim.log.levels.INFO)
    return
  end
  vim.notify('Installing Packer...', vim.log.levels.INFO)
  vim.notify(vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repo, install_path }), vim.log.levels.INFO)
end

function M.uninstall()
  vim.notify(string.format('Removing "%s"...', install_path), vim.log.levels.INFO)
  vim.fn.delete(install_path, 'rf')
  vim.notify(string.format('Removing "%s"...', packages_path), vim.log.levels.INFO)
  vim.fn.delete(packages_path, 'rf')
  vim.notify(string.format('Removing "%s"...', compiled_path), vim.log.levels.INFO)
  remove_compiled_cache()
end

function M.startup()
  if is_packer_installed() then
    local packer = require('packer')
    packer.startup({
      function(use, use_rocks)
        use(packer_name) -- Manage packer by packer
        run_startup(use, use_rocks)
      end,
      config = {
        compile_path = compiled_path,
        max_jobs = 8,
      }
    })
  end

  vim.api.nvim_create_user_command('PackerBootstrap', M.bootstrap,
    { desc = "Install Packer plugin manager" })
  vim.api.nvim_create_user_command('PackerUninstall', M.uninstall,
    { desc = "Remove all plugins installed by Packer and remove Packer itself" })

  run_setup() -- setup non-packer plugins
end

function M.contains(name)
  if plugin_modules[name] then
    return true
  end
  return false
end

return M
