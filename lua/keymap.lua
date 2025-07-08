-- keymap.lua

-- Set leader key (ensure this matches your init.lua)
vim.g.mapleader = " "

-- Shorthand for mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
