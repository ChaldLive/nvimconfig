
return {
  "hrsh7th/cmp-cmdline",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

  },
  config = function()
    local cmp = require("cmp")

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
        { name = "buffer" },
        { name = "path" }, -- Enables path completion
        { name = "luasnip" }, -- Enables snippet completion
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }, -- Search text within buffers
      },
    })
  end,
}
