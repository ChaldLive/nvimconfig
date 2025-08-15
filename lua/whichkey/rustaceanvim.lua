local dap = require("dap")

return function(ctx)
	return {
		{ "<F5>", dap.continue, desc = "Rust: Dap. continue", buffer = ctx.buf },
		{ "<F9>", dap.toggle_breakpoint, desc = "Rust: Toggle Breakpoint", buffer = ctx.buf },
		{ "<F10>", dap.step_over, desc = "Rust: Step over", buffer = ctx.buf },
		{ "<F11>", dap.step_into, desc = "Rust: step into", buffer = ctx.buf },
		{ "<F12>", dap.step_out, desc = "Rust: step out", buffer = ctx.buf },
		{
			"<leader>dr",
			"<cmd>RustLsp debuggables<CR>",
			desc = "Rust: Pick debuggable",
			mode = "n",
			buffer = ctx.buf,
		},
		{ "<leader>d", group = "Rust debug" },
	}
end
