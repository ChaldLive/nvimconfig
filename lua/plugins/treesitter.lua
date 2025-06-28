return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- Load eagerly
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      --			ensure_installed = { "lua", "python", "cpp", "rust", "c_sharp", "java" }, -- Add your languages
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Auto-update Treesitter parsers
    vim.defer_fn(function()
      vim.cmd("TSUpdate")
    end, 0) -- Runs after startup
  end,
}
