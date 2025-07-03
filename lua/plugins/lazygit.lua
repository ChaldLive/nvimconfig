return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
			{ "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)" },
			{ "<leader>lc", "<cmd>LazyGitConfig<cr>", desc = "Edit Lazygit config" },
			{ "<leader>lh", "<cmd>LazyGitFilter<cr>", desc = "Git history (project)" },
			{ "<leader>lH", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "Git history (file)" },
		},
	},
}
