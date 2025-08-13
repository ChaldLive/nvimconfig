require("which-key").register({
  { "<leader>d",  group = "Debug",            mode = "n" },
  { "<leader>db", desc = "Toggle Breakpoint", mode = "n" },
  { "<leader>dc", desc = "Continue",          mode = "n" },
  { "<leader>di", desc = "Step Into",         mode = "n" },
  { "<leader>do", desc = "Step Out",          mode = "n" },
  { "<leader>ds", desc = "Step Over",         mode = "n" },
})
