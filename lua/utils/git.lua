-- Tiny helper function referenced inside yazi.lua, but it is a general-purpose function
-- So it could be used by other plugin logic to make it aware of dangerous git operations

local M = {}

--- Checks if a dangerous Git operation is in progress
---@return boolean
function M.is_git_busy()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null"):gsub("%s+", "")
	if git_dir == "" then
		return false
	end

	return vim.fn.isdirectory(git_dir .. "/rebase-merge") == 1
		or vim.fn.isdirectory(git_dir .. "/rebase-apply") == 1
		or vim.fn.filereadable(git_dir .. "/MERGE_HEAD") == 1
		or vim.fn.filereadable(git_dir .. "/CHERRY_PICK_HEAD") == 1
end

return M
