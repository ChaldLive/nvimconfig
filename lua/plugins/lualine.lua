return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local git_utils = require("utils.git")

    local function git_mode()
      if not vim.b.gitsigns_head then
        return { " no repo", color = { fg = "#888888" } } -- gray
      end

      if git_utils.is_git_busy() then
        return { "🔧 rebase/merge", color = { fg = "#FF5F5F" } } -- red
      end

      local root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+$", "")
      if root == "" then
        return ""
      end

      local status = vim.fn.systemlist("git status --porcelain")[1]
      if status and status ~= "" then
        return { "⚠ dirty", color = { fg = "#FFD700" } } -- yellow
      end

      return { "✔ clean", color = { fg = "#00FF88" } } -- green
    end

    require("lualine").setup({
      options = {
        theme = "Dracula",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
          { git_mode, icon = "" },
        },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree", "quickfix", "lazy" },
    })
  end,
}
