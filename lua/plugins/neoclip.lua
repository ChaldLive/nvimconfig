return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua", -- 🔧 Needed for persistent clipboard history
    },
    keys = {
      { "<leader>fy", "<cmd>Telescope neoclip<CR>", desc = "Clipboard History (Neoclip)" },
    },
    config = function()
      require("neoclip").setup({
        history = 1000,
        enable_persistent_history = true,
        enable_macro_history = true,
        keys = {
          telescope = {
            i = {
              select = "<CR>",
              paste = "<C-p>",
              paste_behind = "<C-k>",
              replay = "<C-q>",
              delete = "<C-d>",
            },
            n = {
              select = "<CR>",
              paste = "p",
              paste_behind = "P",
              replay = "q",
              delete = "d",
            },
          },
        },
      })

      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("neoclip")
      end
    end,
  },
}
