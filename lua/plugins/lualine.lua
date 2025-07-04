return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.opt.termguicolors = true
    vim.opt.guicursor = "n-v-c:block"
    vim.opt.cursorline = false

    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
