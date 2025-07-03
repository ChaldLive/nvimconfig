return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "rust_analyzer", 👈 optional: comment this out if rustaceanvim handles it via rustup
          "ts_ls",
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup only non-Rust language servers
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({})

      -- Optional: if using mason-lspconfig with handlers
      -- you could exclude rust_analyzer here too

      -- LSP-related keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>gf", function()
              vim.lsp.buf.format({ async = true })
            end, { buffer = bufnr, desc = "Format current buffer" })
          end
        end,
      })
    end,
  },
}
