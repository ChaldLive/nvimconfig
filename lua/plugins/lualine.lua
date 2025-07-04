return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Inline Git status component with stable string output
		local git_status = function()
			local gitsigns = vim.b.gitsigns_status_dict
			if not gitsigns then
				return ""
			end

			local added = gitsigns.added or 0
			local changed = gitsigns.changed or 0
			local removed = gitsigns.removed or 0

			if added == 0 and changed == 0 and removed == 0 then
				return ""
			end

			return string.format("+%d ~%d -%d", added, changed, removed)
		end

		require("lualine").setup({
			options = {
				theme = "Dracula",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
					{ git_status, icon = "" },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-tree", "quickfix", "lazy" },
		})
	end,
}
