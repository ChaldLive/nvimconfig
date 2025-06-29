return {
	{
		"tversteeg/registers.nvim",
		cmd = "Registers",
		keys = {
			{ '"', mode = { "n", "v" }, desc = "Open Registers window" },
			{ "<C-R>", mode = "i", desc = "Insert from Register" },
		},
		opts = {
			show_empty = false,
			system_clipboard = true,
			show = '*+"-/_=%0123456789abcdefghijklmnopqrstuvwxyz',
			register_usernames = {
				['"'] = "default",
				["+"] = "system clipboard",
				["*"] = "selection",
				["_"] = "black hole",
			},
		},
	},
}
