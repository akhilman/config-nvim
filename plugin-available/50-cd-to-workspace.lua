local project_root_marks = {
  '.git',
  'package.json',
  'Cargo.toml',
  'pyproject.toml',
}

local function get_project_root_dir()
  local lsp_workspace_dir = vim.lsp.buf.list_workspace_folders()[1]
  if lsp_workspace_dir then
    return lsp_workspace_dir
  end
  local current_file_directory = vim.fn.expand('%:p:h')
  if current_file_directory == '' then
    return nil
  end
  local directory = current_file_directory
  repeat
    for _, fname in ipairs(project_root_marks) do
      if vim.fn.empty(vim.fn.glob(directory .. '/' .. fname)) == 0 then
        return directory
      end
    end
    directory = vim.fn.fnamemodify(directory, ':h')
  until directory == "/"

  return current_file_directory
end


local function autochdir()
  local project_root_dir = get_project_root_dir()
  if project_root_dir ~= nil then
    vim.notify('Changing directory to ' .. project_root_dir, vim.log.levels.INFO)
    vim.cmd('lcd ' .. project_root_dir)
  end
end

-- vim.api.nvim_create_autocmd(
--   { 'BufReadPost', 'FileReadPost' },
--   { callback = autochdir }
-- )
vim.api.nvim_create_user_command('CdToWorkspace', autochdir,
  { desc = "Change current directory to workspace root" })
