return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Java
        null_ls.builtins.formatting.google_java_format,

        -- C#
        null_ls.builtins.formatting.csharpier,

        -- Markdown
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.alex,

        -- ✅ JavaScript / TypeScript / Web formats
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "json",
            "yaml",
            "html",
            "css",
            "scss",
            "markdown",
          },
        }),
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("FormatOnSave_" .. bufnr, { clear = true })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })

          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = bufnr, desc = "Format current buffer" })
        end
      end,
    })
  end,
}
