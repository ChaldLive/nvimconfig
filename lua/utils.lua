-- .config/utils.lua
-- This file is a collection of utility functions worth making them gloabally available.
-- Hence the placement of this file.
local M = {}
-- This function is a global helper utility to safely require modules guaranteeing
-- that if the module fails to load, it will not throw an error but instead return nil
-- and notify the user.
-- example usage:
-- local my_module = M.safe_require("my_module") and if that fails you wont be stuck
-- with in incomprehensible call stack or en esoteric error message.
function M.safe_require(mod)
  local ok, result = pcall(require, mod)
  if not ok then
    vim.notify("Failed to require: " .. mod, vim.log.levels.ERROR)
  end
  return ok and result or nil
end

return M
