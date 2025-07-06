return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs", "<cmd>Git<CR>",             desc = "Git status" },
      { "<leader>gb", "<cmd>G blame<CR>",         desc = "Git blame" },
      { "<leader>gd", "<cmd>Gdiffsplit<CR>",      desc = "Git diff (split)" },
      { "<leader>gl", "<cmd>G log --oneline<CR>", desc = "Git log (oneline)" },
    },
  },
}
