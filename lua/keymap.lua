-- Key mappings configuration
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map 'jj' to exit insert mode
map("i", "jj", "<Esc>", opts)
map("i", "jk", "<Esc>", opts)

-- Dismiss to many anoying messages when in error mode.
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { })
