
return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_SetFocus = 1
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_SplitWidth = 35

        -- Keybinding to toggle Undotree
        vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
    end
}
