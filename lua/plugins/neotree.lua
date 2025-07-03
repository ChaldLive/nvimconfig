return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"kyazdani42/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree when it is the last window
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			hide_gitignored = true,
			filesystem = {
				filtered_items = {
					hide_by_name = {
						".DS_Store",
						".DS_Store/",
						"Thumbs.db",
						"desktop.ini",
						".localized",
					},
					never_show = {
						".DS_Store",
						".DS_Store/",
						".git",
						".Trash",
						".cache",
						"__pycache__",
						"node_modules",
					},
					visible = true,
					hide_dotfiles = false,
				},
				follow_current_file = true, -- Follow the currently active file
				hijack_netrw_behavior = "open_current", -- NetRW replacement
				use_libuv_file_watcher = true, -- Faster updates
			},
			buffers = {
				follow_current_file = true,
			},
			window = {
				position = "left",
				width = 45,
				mappings = {
					["<CR>"] = "open",
					["l"] = "open",
					["h"] = "close_node",
					["r"] = "rename",
					["d"] = "delete",
					["n"] = "none",
					["c"] = "copy",
					["x"] = "none", -- could be set to "cut_to_clipboard"
					["p"] = "none",
				},
			},
		})
	end,
}
