-- utils/lualine_git.lua
local M = {}
local git_utils = require("utils.git")

local last_result = nil
local last_status = ""
local last_time = 0
local debounce_ms = 1000

function M.status_component()
	local now = vim.loop.hrtime() / 1e6 -- ms

	-- If recent, return cached table to avoid new object
	if last_result and now - last_time < debounce_ms then
		return last_result
	end

	last_time = now
	local result

	if not vim.b.gitsigns_head then
		result = { " no repo", color = "LualineGitGray" }
	elseif git_utils.is_git_busy() then
		result = { "🔧 rebase/merge", color = "LualineGitRebase" }
	else
		local status = vim.fn.systemlist("git status --porcelain")[1]
		if status and status ~= "" then
			result = { "⚠ dirty", color = "LualineGitDirty" }
		else
			result = { "✔ clean", color = "LualineGitClean" }
		end
	end

	last_result = result
	return result
end

return M
