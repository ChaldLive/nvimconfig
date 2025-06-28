return {
       "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Ensure it loads early
        config = function()
       require("catppuccin").setup({
            flavour = "Macchiato", -- or latte, frappe, macchiato
            integrations = {
               telescope = true,
            }
        })
            vim.cmd.colorscheme("catppuccin")
        end
}

