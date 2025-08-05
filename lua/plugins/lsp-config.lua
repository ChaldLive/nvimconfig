return {
	-- 🧱 Mason: LSP/DAP/tool installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- 🔌 Mason LSP bridge
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls", -- ✅ Correct name
					"html",
					"emmet_ls",
				},
			})
		end,
	},

	-- 🛠️ Mason tool installer (formatters, linters)
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

	-- 🧠 LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")

				if client.supports_method("textDocument/formatting") then
					map("n", "<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, "Format Buffer")
				end
			end

			-- 🧩 Language Servers
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- ✅ Modern TypeScript setup
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Disable formatting if you use prettier elsewhere
					client.server_capabilities.documentFormattingProvider = false
					on_attach(client, bufnr)
				end,
				settings = {
					typescript = {
						format = { enable = false },
					},
					javascript = {
						format = { enable = false },
					},
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = function()
					return vim.loop.cwd()
				end,
				single_file_support = false,
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"html",
					"css",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
			})
		end,
	},
}
