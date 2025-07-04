return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>-",  "<cmd>Yazi<cr>",        desc = "Open Yazi at current file" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>",    desc = "Open Yazi at cwd" },
      { "<C-Up>",     "<cmd>Yazi toggle<cr>", desc = "Resume last Yazi session" },
    },
    opts = {
      open_for_directories = false,
      floating_window_scaling_factor = 0.9,
      yazi_floating_window_border = "rounded",
      -- Safe-guard logic : If a Git rebase, merge, or cherry-pick is detected, Yazi politely backs off from syncing.
      -- Otherwise, it updates both the working directory and Neo-tree root to match your selection.
      hooks = {
        yazi_closed_successfully = function(chosen_file, config, state)
          local git = require("utils.git")
          if git.is_git_busy() then
            vim.notify("⛔ Git operation in progress – skipping directory sync", vim.log.levels.WARN)
            return
          end

          local Path = require("plenary.path")
          local target = Path:new(chosen_file)
          local dir = target:is_dir() and target:absolute() or target:parent().filename

          vim.cmd("cd " .. vim.fn.fnameescape(dir))
          vim.cmd("Neotree dir=" .. vim.fn.fnameescape(dir) .. " reveal_force_cwd")
        end,
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
