-- File: lua/macros/init.lua
local M = {}

function M.save_and_format()
  vim.cmd("w")
  vim.lsp.buf.format()
end

function M.toggle_comment()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gcc", true, false, true), "n", true)
end

function M.clear_highlight()
  vim.cmd("nohlsearch")
end

function M.duplicate_line()
  vim.cmd("normal! yyP")
end

function M.run_file()
  vim.cmd("!lua %") -- Change 'lua' to your preferred interpreter
end

function M.open_terminal()
  vim.cmd("split | terminal")
end

return M
