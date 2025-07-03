return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- pin to a stable version
    ft = { "rust" }, -- load only for Rust files
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      }
    end,
  },
}
