local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- You can choose your snippet engine here
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- ← this powers `.lines()` suggestions
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})
