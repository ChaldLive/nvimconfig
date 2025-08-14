-- lua/dap.lua

local dap = require("dap")
local wk = require("which-key")

wk.add({
  {
    "<leader>db",
    function()
      dap.toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
    mode = "n",
  },
  {
    "<leader>dc",
    function()
      dap.continue()
    end,
    desc = "Continue",
    mode = "n",
  },
  {
    "<leader>di",
    function()
      dap.step_into()
    end,
    desc = "Step Into",
    mode = "n",
  },
  {
    "<leader>do",
    function()
      dap.step_out()
    end,
    desc = "Step Out",
    mode = "n",
  },
  {
    "<leader>ds",
    function()
      dap.step_over()
    end,
    desc = "Step Over",
    mode = "n",
  },
  { "<leader>d", group = "Debug 🐞" },
})
