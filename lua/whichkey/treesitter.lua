-- lua/whichkey/treesitter.lua

local wk = require("which-key")

wk.add({
  { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>", desc = "Highlight Groups", mode = "n" },
  { "<leader>tp", "<cmd>TSPlaygroundToggle<CR>", desc = "Toggle Playground", mode = "n" },
  { "<leader>ti", "<cmd>TSInstallInfo<CR>", desc = "Install Info", mode = "n" },
  { "<leader>tu", "<cmd>TSUpdate<CR>", desc = "Update Parsers", mode = "n" },
  { "<leader>t", group = "Treesitter 🌳" },
})
