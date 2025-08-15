return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- pin to a stable version
		ft = { "rust" }, -- load only for Rust files
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			}
			-- 🧠 Rust-specific DAP keymaps
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function()
					local wk = require("which-key")
					local rust_keys = require("whichkey.rustaceanvim")

					local ctx = {
						buf = vim.api.nvim_get_current_buf(),
						file = vim.api.nvim_buf_get_name(0),
					}
					wk.add(rust_keys(ctx), { buffer = ctx.buf, mode = "n" })
				end,
			})
		end,
	},
}
