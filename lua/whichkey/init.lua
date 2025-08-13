local wk = require("which-key")

-- ✅ Setup with updated options
wk.setup({
	win = {
		border = "single",
	},
	plugins = {
		spelling = { enabled = true },
	},
	layout = {
		align = "center",
	},
})

-- 🚀 Load all modular mappings
require("whichkey.macros")
require("whichkey.dap")
require("whichkey.telescope")
require("whichkey.treesitter")
