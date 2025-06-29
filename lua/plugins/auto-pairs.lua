-- Easing up writing brackets and surrunding stuff.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- smarter pair insertion based on syntax
    })
  end,
}
