-- Formatting

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

local function format_buffer()
  if vim.lsp.buf.server_ready() then
    vim.lsp.buf.format { async = true }
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

vim.keymap.set("n", "<LocalLeader>f", format_buffer,
  { silent = true, desc = "Format current buffer" })
vim.api.nvim_create_user_command("Format", format_buffer,
  { desc = "Format a code or text in the current buffer" })
