local compiled_path = vim.fn.stdpath('config') .. '/plugin/ZZ-packer_compiled.lua'
local packages_path = vim.fn.stdpath('data') .. '/site/pack/packer/'
local packer_path = packages_path .. 'start/packer.nvim'
local packer_name = 'wbthomason/packer.nvim'
local packer_repo = 'https://github.com/' .. packer_name

local M = {}

function M.try_use(cfg)
  local ok, packer = pcall(function() return require 'packer' end)
  if ok and packer then
    packer.use(cfg)
  end
end

function M.bootstrap()
  if vim.fn.isdirectory(packer_path) == 1 then
    vim.notify('Packer already installed', vim.log.levels.INFO)
    return
  end
  vim.notify('Installing Packer...', vim.log.levels.INFO)
  vim.notify(vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repo, packer_path }), vim.log.levels.INFO)
end

function M.update_config()
  local ok, packer = pcall(function() return require 'packer' end)
  if not ok or not packer then
    return
  end

  local comp_time = vim.fn.getftime(compiled_path) -- -1 if file is not exist
  local mod_time = -1

  local plugins = vim.split(vim.fn.glob(vim.fn.stdpath('config') .. '/plugin/**/*.lua'), '\n')
  for _, f in ipairs(plugins) do
    local mtime = vim.fn.getftime(f)
    if mtime > mod_time then
      mod_time = mtime
    end
  end

  if mod_time > comp_time then
    vim.notify('Updating plugin configuration', vim.log.levels.INFO)
    vim.fn.delete(compiled_path)
    vim.cmd 'autocmd User PackerComplete ++once PackerCompile'
    packer.install()
  end
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
