local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
      local map = function(lhs, cmd, desc)
        vim.keymap.set("n", lhs, cmd, { desc = desc, buffer = true })
      end

      -- 🛠️ Cargo commands
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

      -- 🐛 DAP Debugging commands
      local dap = require("dap")

      map("<leader>dd", function()
        local binary = vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        dap.run({
          name = "Rust Debug",
          type = "lldb",
          request = "launch",
          program = binary,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        })
      end, "DAP: Debug Rust")

      map("<leader>dc", function()
        dap.continue()
      end, "DAP: Continue")

      map("<leader>db", function()
        dap.toggle_breakpoint()
      end, "DAP: Toggle Breakpoint")

      map("<leader>ds", function()
        dap.step_over()
      end, "DAP: Step Over")

      map("<leader>di", function()
        dap.step_into()
      end, "DAP: Step Into")

      map("<leader>do", function()
        dap.step_out()
      end, "DAP: Step Out")

      map("<leader>du", function()
        require("dapui").toggle()
      end, "DAP UI: Toggle")
    end,
  })
end

return M
