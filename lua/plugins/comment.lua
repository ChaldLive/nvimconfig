-- ~/.config/nvim/lua/plugins/comment.lua
return {
	{
		"numToStr/Comment.nvim",
		lazy = true,
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				init = function()
					vim.g.skip_ts_context_commentstring_module = true
				end,
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = false, -- Comment.nvim manages updates
					})
				end,
			},
		},
		opts = {
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			pre_hook = function(ctx)
				-- Lazy load only when needed
				local U = require("Comment.utils")

				-- Determine whether to use linewise or blockwise commentstring
				local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

				-- Calculate commentstring location (cursor or visual mode)
				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = type,
					location = location,
				})
			end,
		},
	},
}
