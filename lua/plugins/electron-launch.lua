-- ~/.config/nvim/lua/plugins/electron-launch.lua
return {
  --  "ChaldLive/electron-launch.nvim",
  dir = "/Users/chald/work/programming/lua/electron-launch.nvim/",
  lazy = true,
  config = function()
    require("electron").setup()
  end,
  cmd = { "ElectronNew", "ElectronDetectRoot", "ElectronLaunch" },
}
