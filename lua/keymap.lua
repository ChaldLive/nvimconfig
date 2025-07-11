-- keymap.lua

-- Set leader key (ensure this matches your init.lua)
vim.g.mapleader = " "

-- Shorthand for mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local macros = require("macros.macroes")

-- 🛸 Insert Mode
map("i", "jj", "<Esc>", opts)
map("i", "jk", "<Esc>", opts)

-- 📤 Utility
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
map("n", "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", opts)

-- 🧪 LazyGit Mappings
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", { desc = "LazyGit (current file)" })
map("n", "<leader>lc", "<cmd>LazyGitConfig<cr>", { desc = "Edit Lazygit config" })
map("n", "<leader>lh", "<cmd>LazyGitFilter<cr>", { desc = "Git history (project)" })
map("n", "<leader>lH", "<cmd>LazyGitFilterCurrentFile<cr>", { desc = "Git history (file)" })

-- Telescope keybindings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Macroes.lua bindings, using Karabiner-elements to fix and remap capl-lock to F19
vim.keymap.set("n", "<F19>a", macros.save_and_format, { noremap = true, silent = true })
vim.keymap.set("n", "<F19>b", macros.toggle_comment, { noremap = true, silent = true })
vim.keymap.set("n", "<F19>c", macros.clear_highlight, { noremap = true, silent = true })
vim.keymap.set("n", "<F19>d", macros.duplicate_line, { noremap = true, silent = true })
vim.keymap.set("n", "<F19>e", macros.run_file, { noremap = true, silent = true })
vim.keymap.set("n", "<F19>t", macros.open_terminal, { noremap = true, silent = true })
