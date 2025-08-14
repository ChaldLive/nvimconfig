-- lua/whichkey/telescope.lua

local wk = require("which-key")

wk.add({
	{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find Files", mode = "n" },
	{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Live Grep", mode = "n" },
	{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", desc = "Buffers", mode = "n" },
	{ "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "Help Tags", mode = "n" },
	{ "<leader>f", group = "Telescope 🔭" },
})
