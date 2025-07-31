return {
  {
    dir = "/Users/chald/work/programming/Lua/keylint.nvim",
    name = "keylint.nvim", -- Optional, helps Lazy label things nicely
    lazy = true,

    cmd = {
      "KeyLintConflicts",
      "KeyLintCheatSheet",
      "KeyLintManifest",
      "KeyLintAudit",
      "KeyLintDebugKeys",
    },

    config = function()
      require("keylint")
    end,
  },
}
