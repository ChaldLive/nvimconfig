return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustywind,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Java
        null_ls.builtins.formatting.google_java_format,

        -- C#
        null_ls.builtins.formatting.csharpier,

        -- ✍️ Markdown formatters/linters
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.markdownlint,
        -- Optional: for inclusive writing suggestions
        null_ls.builtins.diagnostics.alex,
        -- Optional: use prettier for consistent formatting
        -- null_ls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
      },
      on_attach = function(client, bufnr)
        -- Only set up auto-format if the LSP client supports formatting
        if client.supports_method("textDocument/formatting") then
          -- Define a unique autocmd group for this buffer to avoid conflicts
          local augroup = vim.api.nvim_create_augroup("FormatOnSave_" .. bufnr, { clear = true })

          -- Set up format-on-save
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })

          -- Optional: Set buffer-local keymap to manually format
          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = bufnr, desc = "Format current buffer" })
        end
      end,
    })
  end,
}
