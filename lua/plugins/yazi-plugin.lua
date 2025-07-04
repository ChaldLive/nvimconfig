return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>-", "<cmd>Yazi<cr>", desc = "Open Yazi at current file" },
			{ "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi at cwd" },
			{ "<C-Up>", "<cmd>Yazi toggle<cr>", desc = "Resume last Yazi session" },
		},
		opts = {
			open_for_directories = false,
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_border = "rounded",
		},
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
