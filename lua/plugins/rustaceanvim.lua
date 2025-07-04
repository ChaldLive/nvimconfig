return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- pin to a stable version
    ft = { "rust" }, -- load only for Rust files
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      }
      -- 🧠 Rust-specific DAP keymaps
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = true, desc = desc })
          end

          map("<F5>", function()
            require("dap").continue()
          end, "Rust: DAP Continue")
          map("<F9>", function()
            require("dap").toggle_breakpoint()
          end, "Rust: Toggle Breakpoint")
          map("<F10>", function()
            require("dap").step_over()
          end, "Rust: Step Over")
          map("<F11>", function()
            require("dap").step_into()
          end, "Rust: Step Into")
          map("<F12>", function()
            require("dap").step_out()
          end, "Rust: Step Out")
          map("<leader>dr", function()
            vim.cmd("RustLsp debuggables")
          end, "Rust: Pick Debbugable")
        end,
      })
    end,
  },
}
