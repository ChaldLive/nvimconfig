return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- Load eagerly
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,

			ensure_installed = {
				"lua",
				"python",
				"cpp",
				"rust",
				"c_sharp",
				"java",
				"markdown",
				"markdown_inline", -- Add these two!
			},
			--			ensure_installed = { "lua", "python", "cpp", "rust", "c_sharp", "java" }, -- Add your languages
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
		-- Auto-update Treesitter parsers
		vim.defer_fn(function()
			vim.cmd("TSUpdate")
		end, 0) -- Runs after startup
	end,
}
