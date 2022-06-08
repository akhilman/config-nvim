local M = {}

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packages_path = vim.fn.stdpath('data') .. '/site/pack/packer/'
local compiled_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
local packer_name = 'wbthomason/packer.nvim'
local packer_repo = 'https://github.com/' .. packer_name

local plugin_names = {}
local plugin_modules = {}

local function is_packer_installed()
  local success, _ = pcall(function() require 'packer' end)
  return success
end

local function is_packer_cached()
  return vim.fn.empty(vim.fn.glob(compiled_path)) == 0
end

-- Load plugin modules and set module global variable `plugin_modules`
local function load_plugin_modules(plugins)
  plugin_modules = {} -- module global
  plugin_names = {} -- module global
  for _, modname in pairs(plugins) do
    local success, module_or_errormsg = pcall(function()
      return require(modname)
    end)
    if success then
      table.insert(plugin_modules, module_or_errormsg)
      table.insert(plugin_names, modname)
    else
      vim.notify(module_or_errormsg, vim.log.levels.ERROR)
    end
  end
end

-- Startup plugins
local function run_startup(use, use_rocks)
  for _, module in pairs(plugin_modules) do
    local success, errormsg = pcall(function()
      if module.packer_startup then module.packer_startup(use, use_rocks) end
    end)
    if not success then
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
      vim.notify(errormsg, vim.log.levels.ERROR)
    end
  end
end

local function packer_bootstrap()
  if is_packer_installed() then
    vim.notify('Packer already installed', vim.log.levels.INFO)
    return
  end
  vim.notify('Installing Packer...', vim.log.levels.INFO)
  vim.notify(vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repo, install_path }), vim.log.levels.INFO)
end

local function remove_compiled_cache()
  vim.fn.system({ 'rm', '-rf', compiled_path })
end

local function remove_outdated_compiled_cache()

  local compiled_mtime = vim.fn.getftime(compiled_path)
  if compiled_mtime < 0 then
    return
  end

  local outdated = false
  if vim.fn.getftime(vim.fn.stdpath('config') .. '/init.lua') > compiled_mtime then
    outdated = true
  end
  for _, modname in ipairs(plugin_names) do
    local path = vim.fn.stdpath('config') .. '/lua/' .. modname .. '.lua'
    if vim.fn.getftime(path) > compiled_mtime then
      outdated = true
    end
  end

  if outdated then
    vim.notify('Removing outdated packer cache', vim.log.levels.INFO)
    remove_compiled_cache()
  end
end

local function packer_uninstall()
  vim.notify(string.format('Removing "%s"...', install_path), vim.log.levels.INFO)
  vim.fn.system({ 'rm', '-rvf', install_path })
  vim.notify(string.format('Removing "%s"...', packages_path), vim.log.levels.INFO)
  vim.fn.system({ 'rm', '-rvf', packages_path })
  vim.notify(string.format('Removing "%s"...', compiled_path), vim.log.levels.INFO)
  remove_compiled_cache()
end

function M.setup_plugins(plugins)
  -- Only required if you have packer configured as `opt`
  load_plugin_modules(plugins) -- Sets module global variable `plugin_modules`
  if is_packer_installed() then

    local packer_was_cached = is_packer_cached()
    remove_outdated_compiled_cache()

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
    -- Recompile
    if packer_was_cached and not is_packer_cached() then
      require('packer').compile()
    end

  elseif is_packer_cached() then
    remove_compiled_cache()
  end

  vim.api.nvim_create_user_command('PackerBootstrap', packer_bootstrap, {})
  vim.api.nvim_create_user_command('PackerUninstall', packer_uninstall, {})

  run_setup() -- setup non-packer plugins
end

return M
