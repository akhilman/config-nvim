-- Formatting

local M = {}

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
  elseif prettier_formats[vim.bo.filetype] and vim.fn.executable("prettier") == 1 then
    vim.cmd("%! prettier --parser " .. vim.bo.filetype)
  elseif vim.bo.filetype == "toml" and vim.fn.executable("toml-fmt") == 1 then
    vim.cmd("%! toml-fmt")
  elseif vim.bo.filetype == "python" and vim.fn.executable("black") == 1 then
    vim.cmd("%! black -q -")
  else
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd('normal gggqG')
    vim.api.nvim_win_set_cursor(0, cursor)
  end
end

function M.setup()
  vim.keymap.set('n', '<space>f', formatting, { silent = true })
end

return M
