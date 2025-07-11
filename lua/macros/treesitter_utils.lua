local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

function M.get_rust_function_signature()
  local node = ts_utils.get_node_at_cursor()
  local depth = 0

  while node and depth < 10 do
    if node:type() == "function_item" then
      local params = {}
      local return_type = ""

      for child in node:iter_children() do
        if child:type() == "parameters" then
          for param_node in child:iter_children() do
            local param_text = vim.treesitter.get_node_text(param_node, 0)
            if param_text ~= "" and not param_text:match("^%p*$") then
              table.insert(params, param_text)
            end
          end
        elseif child:type():match("type") then
          local candidate = vim.treesitter.get_node_text(child, 0)
          if candidate and candidate ~= "" then
            return_type = candidate
          end
        end
      end

      return {
        parameters = params,
        returns = return_type ~= "" and return_type or "void",
      }
    end

    node = node:parent()
    depth = depth + 1
  end

  return nil
end

return M
