-- ~/.config/nvim/lua/plugins/comment.lua
return {
	{
		"tpope/vim-commentary",
		keys = {
			{ "gcc", desc = "Toggle comment line (vim-commentary)" },
			{ "gc", mode = { "n", "v" }, desc = "Toggle comment block (vim-commentary)" },
		},
	},
}
