return {
  {
    "git@github.com:github/copilot.vim.git",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = false,
        ["javascript"] = true,
        ["rust"] = true,
        ["typescript"] = true,
        ["python"] = true,
        ["lua"] = true,
        ["text"] = true,
        ["html"] = true,
        ["json"] = true,
        ["yaml"] = true,
      }
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
    lazy = false,
  },
}
