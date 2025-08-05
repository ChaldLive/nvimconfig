return {
  -- 🧩 Completion sources
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "mattn/emmet-vim", -- ✅ Emmet core
        ft = { "html", "css", "javascriptreact", "typescriptreact" },
      },
      {
        "dcampos/cmp-emmet-vim", -- ✅ cmp source for emmet-vim
        ft = { "html", "css", "javascriptreact", "typescriptreact" },
      },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-,>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "emmet_vim" }, -- ✅ correct source name
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        }),
      })

      -- Cmdline completion for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
      })

      -- Cmdline completion for '/'
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}
