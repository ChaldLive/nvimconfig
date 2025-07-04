local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			local map = function(lhs, cmd, desc)
				vim.keymap.set("n", lhs, cmd, { desc = desc, buffer = true })
			end

			map("<leader>cb", function()
				vim.cmd("belowright split | terminal cargo build")
			end, "Cargo: Build")

			map("<leader>cc", function()
				vim.system({ "cargo", "check" }, { text = true }, function(res)
					local msg = res.code == 0 and res.stdout or res.stderr
					local level = res.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR
					vim.notify(msg, level, { title = "Cargo Check" })
				end)
			end, "Cargo: Check")

			map("<leader>cr", function()
				vim.cmd("belowright split | terminal cargo run")
			end, "Cargo: Run")

			map("<leader>cq", function()
				vim.cmd("cexpr system('cargo build 2>&1') | copen")
			end, "Cargo: Quickfix Build")
		end,
	})
end

return M
