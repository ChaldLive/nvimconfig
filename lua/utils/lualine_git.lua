-- utils/lualine_git.lua

local M = {}
local git_utils = require("utils.git")

local last_status = ""
local last_time = 0
local debounce_ms = 1000

---Returns cached Git status info with color
---@return table
function M.status_component()
	local now = vim.loop.hrtime() / 1e6 -- convert to ms
	if now - last_time < debounce_ms then
		return last_status
	end
	last_time = now

	local result

	if not vim.b.gitsigns_head then
		result = { " no repo", color = { fg = "#888888" } }
	elseif git_utils.is_git_busy() then
		result = { "🔧 rebase/merge", color = { fg = "#FF5F5F" } }
	else
		local root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+$", "")
		if root == "" then
			result = { "", color = { fg = "#888888" } }
		else
			local status = vim.fn.systemlist("git status --porcelain")[1]
			if status and status ~= "" then
				result = { "⚠ dirty", color = { fg = "#FFD700" } }
			else
				result = { "✔ clean", color = { fg = "#00FF88" } }
			end
		end
	end

	last_status = result
	return result
end

return M
