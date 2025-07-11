return {

  -- 🧪 Fake test plugin for Keylint.nvim
  {
    "ChaldLive/keylint.nvim",
    keys = {
      { "<leader>ff", "<cmd>FakeRun<cr>",   desc = "Fake run" },
      { "<leader>fb", "<cmd>FakeBuild<cr>", desc = "Fake build" },
    },
  },
  {
    "ChaldLive/keylint.nvim",
    lazy = true,
    cmd = "KeylintAudit",
    config = function()
      -- No config needed yet, but you can later register filters, exclude plugins, etc.
    end,
  },
}
