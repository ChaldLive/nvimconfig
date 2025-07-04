return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")

      dap.adapters.lldb = {
        type = "executable",
        command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- Adjust this path as needed
        name = "lldb",
      }

      dap.configurations.rust = {
        {
          name = "Launch Rust executable",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        },
      }
      -- 🔆 Custom breakpoint visuals
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FA5A50", bg = "#1E1E1E" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#FFBD00", bg = "#1E1E1E" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#00BFFF", bg = "#1E1E1E" })

      vim.fn.sign_define("DapBreakpoint", {
        text = "🔴",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "🟡",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "🔵",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
      })
      -- 🔁 Optional: auto-reload or diagnostics configuration can go here
    end,
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Start debugger",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
    },
  },
}
