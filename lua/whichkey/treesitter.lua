require("which-key").register({
  -- Normal mode mappings
  { "<leader>t",  group = "Treesitter",                  mode = "n" },
  { "<leader>ta", desc = "Swap with next parameter",     mode = "n" },
  { "<leader>tA", desc = "Swap with previous parameter", mode = "n" },
  { "]m",         desc = "Next function start",          mode = "n" },
  { "]]",         desc = "Next class start",             mode = "n" },
  { "[m",         desc = "Previous function start",      mode = "n" },
  { "[[",         desc = "Previous class start",         mode = "n" },

  -- Visual mode mappings
  { "af",         desc = "Select outer function",        mode = "x" },
  { "if",         desc = "Select inner function",        mode = "x" },
  { "ac",         desc = "Select outer class",           mode = "x" },
  { "ic",         desc = "Select inner class",           mode = "x" },
  { "ap",         desc = "Select outer parameter",       mode = "x" },
  { "ip",         desc = "Select inner parameter",       mode = "x" },
})
