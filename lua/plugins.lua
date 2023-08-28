local compiled_path = vim.fn.stdpath('config') .. '/plugin/20-packer_compiled.lua'
local packages_path = vim.fn.stdpath('data') .. '/site/pack/packer/'
local packer_path = packages_path .. 'start/packer.nvim'
local packer_name = 'wbthomason/packer.nvim'
local packer_repo = 'https://github.com/' .. packer_name

local M = {}

function M.try_require(mod_name, log_level)
  local ok, mod_or_msg = pcall(function() return require(mod_name) end)
  if ok then
    return mod_or_msg
  end
  if mod_or_msg then
    vim.notify_once(mod_or_msg, log_level or vim.log.levels.ERROR)
  end
end

function M.try_use(cfg)
  local packer = M.try_require('packer', vim.log.levels.INFO)
  if packer then
    packer.use(cfg)
    return true
  end
  return false
end

function M.bootstrap()
  if vim.fn.isdirectory(packer_path) then
    vim.notify('Packer already installed', vim.log.levels.INFO)
    return
  end
  vim.notify('Installing Packer...', vim.log.levels.INFO)
  vim.notify(vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repo, packer_path }), vim.log.levels.INFO)
end

function M.uninstall()
  vim.notify(string.format('Removing "%s"...', packer_path), vim.log.levels.INFO)
  vim.fn.delete(packer_path, 'rf')
  vim.notify(string.format('Removing "%s"...', packages_path), vim.log.levels.INFO)
  vim.fn.delete(packages_path, 'rf')
  vim.notify(string.format('Removing "%s"...', compiled_path), vim.log.levels.INFO)
  vim.fn.delete(compiled_path)
end

function M.init()
  local ok, packer = pcall(function() return require 'packer' end)
  if ok and packer then
    packer.init {
      compile_path = compiled_path,
      max_jobs = 8,
    }
    packer.use {
      packer_name
    }
  end

  vim.api.nvim_create_user_command('PackerBootstrap', M.bootstrap,
    { desc = "Install Packer plugin manager" })
  vim.api.nvim_create_user_command('PackerUninstall', M.uninstall,
    { desc = "Remove all plugins installed by Packer and remove Packer itself" })
end

return M
