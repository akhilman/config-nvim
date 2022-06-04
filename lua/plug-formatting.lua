-- Formatting
local function formatting()
  local prettier_formats = {
    css = true,
    flow = true,
    html = true,
    javascript = true,
    json = true,
    json5 = true,
    less = true,
    markdown = true,
    scss = true,
    typescript = true,
    yaml = true,
  }
  if vim.lsp.buf.server_ready() then
    vim.lsp.buf.formatting()
  elseif prettier_formats[vim.bo.filetype] and vim.fn.executable("prettier") then
    vim.api.nvim_command("%! prettier --parser " .. vim.bo.filetype)
  elseif vim.bo.filetype == "toml" and vim.fn.executable("toml-fmt") then
    vim.api.nvim_command("%! toml-fmt")
  elseif vim.bo.filetype == "python" and vim.fn.executable("black") then
    vim.api.nvim_command("%! black -q -")
  end
end

local M = {}
function M.setup()
  vim.keymap.set('n', '<space>f', formatting, { silent = true })
end

return M
