return {
  {

  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin") -- Add this line
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9, preview_width = 0.5 },
        },
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
      },
    })

    -- Define keymaps
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
  end
},
{
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          }
        }
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  },
}

