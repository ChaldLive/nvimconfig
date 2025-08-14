local wk = require("which-key")
local mc = require("macros.macroes")

wk.add({
  { "<F19>a", mc.save_and_format, desc = "Save & Format", mode = "n" },
  { "<F19>b", mc.toggle_comment, desc = "Toggle Comment", mode = "n" },
  { "<F19>c", mc.clear_highlight, desc = "Clear Highlight", mode = "n" },
  { "<F19>d", mc.duplicate_line, desc = "Duplicate Line", mode = "n" },
  { "<F19>e", mc.run_file, desc = "Run File", mode = "n" },
  { "<F19>f", mc.format_only, desc = "Format Only", mode = "n" },
  { "<F19>t", mc.open_terminal, desc = "Open Terminal", mode = "n" },
  { "<F19>i", mc.get_rust_signature, desc = "Get Rust Signature", mode = "n" },
  { "<F19>", group = "Macros 🎯" },
})
