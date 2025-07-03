-- This one makes your nvim cmdline so much easier, it is the only purpose if this plugin.:w
--
return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { pattern = "^/", icon = " ", lang = "regex" },
					search_up = { pattern = "^%?", icon = " ", lang = "regex" },
				},
			},
			messages = {
				enabled = true,
				view = "mini",
				align = "message",
			},
			popupmenu = {
				enabled = true,
				backend = "cmp",
			},
			lsp = {
				progress = { enabled = true, format = "minimal" },
				hover = { enabled = true, view = "popup" },
				signature = { enabled = true },
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
		})
	end,
}
