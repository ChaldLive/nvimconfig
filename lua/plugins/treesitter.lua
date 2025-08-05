return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- Load eagerly
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
      "windwp/nvim-ts-autotag", -- Auto-close HTML/JSX tags
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting
    },
    {
      "andymass/vim-matchup", -- Smarter % navigation
    },
    {
      "nvim-treesitter/playground", -- Syntax tree inspector
      cmd = "TSPlaygroundToggle",
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false, -- Manual control via Mason

      ensure_installed = {
        -- Core languages
        "lua",
        "python",
        "cpp",
        "rust",
        "c_sharp",
        "java",

        -- Markdown
        "markdown",
        "markdown_inline",

        -- Electron/Web stack
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "toml",
      },

      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },

      matchup = {
        enable = true,
        disable_virtual_text = true,
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })

    -- Auto-update Treesitter parsers
    vim.defer_fn(function()
      vim.cmd("TSUpdate")
    end, 0)
  end,
}
