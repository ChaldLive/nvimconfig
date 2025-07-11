-- File: lua/macros/init.lua
-- Please refer to keymap.lua for the keybindings to these functions as macroes.
local M = {}

function M.save_and_format()
	vim.lsp.buf.format()
	vim.cmd("w")
end

function M.toggle_comment()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gcc", true, false, true), "n", true)
end

function M.clear_highlight()
	vim.cmd("nohlsearch")
end

function M.duplicate_line()
	vim.cmd("normal! yyP")
end

function M.run_file()
	vim.cmd("!lua %") -- Change 'lua' to your preferred interpreter
end

function M.open_terminal()
	vim.cmd("split | terminal")
end

function M.get_rust_signature()
	local ts_helpers = require("macros.treesitter_utils")
	local signature = ts_helpers.get_rust_function_signature()

	if not signature then
		print("☕ No Rust function found under cursor. Coffee break?")
		return
	end

	-- Clean up parameter list
	local filtered_params = vim.tbl_filter(function(param)
		return param and param ~= "" and not param:match("^%p*$")
	end, signature.parameters)

	print("🔧 Params: " .. (#filtered_params > 0 and table.concat(filtered_params, ", ") or "None"))

	local return_type = signature.returns ~= "" and signature.returns or "void"
	print("↩️ Returns: " .. return_type)
end

function M.generate_rust_doc_comment()
	local ts_helpers = require("macros.treesitter_utils")
	local signature = ts_helpers.get_rust_function_signature()

	if not signature then
		print("📭 No Rust function found under cursor.")
		return
	end

	-- Parse params into doc lines
	local param_lines = {}
	for _, param in ipairs(signature.parameters) do
		local name = param:match("^([%w_]+)")
		table.insert(param_lines, string.format("/// - `%s`: %s", name or param, param))
	end

	-- Build final comment block
	local lines = {}
	table.insert(lines, "/// Description goes here.")
	table.insert(lines, "///")
	if #param_lines > 0 then
		table.insert(lines, "/// # Parameters")
		vim.list_extend(lines, param_lines)
		table.insert(lines, "///")
	end
	table.insert(lines, "/// # Returns")
	table.insert(lines, string.format("/// %s", signature.returns ~= "" and signature.returns or "void"))

	-- Optional: Insert above function
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

return M
