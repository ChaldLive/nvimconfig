-- File: ~/.config/nvim/lua/options.lua

-- Core editor options
local options = {
  backup = false,
  swapfile = false,
  writebackup = false,
  fileencoding = "utf-8",
  clipboard = "unnamedplus",
  mouse = "a",

  -- UI settings
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  cmdheight = 2,
  showmode = false,
  showtabline = 2,
  cursorline = false,
  wrap = true,
  linebreak = true,
  scrolloff = 8,
  sidescrolloff = 8,
  whichwrap = "bs<>[]hl",
  termguicolors = true,
  guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20",

  -- Indentation
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smartindent = true,

  -- Search
  hlsearch = true,
  ignorecase = true,
  smartcase = true,

  -- Completion & popup behavior
  completeopt = { "menuone", "noselect" },
  pumheight = 10,
  timeoutlen = 300,
  updatetime = 300,

  -- Splits
  splitbelow = true,
  splitright = true,

  -- Markdown & conceal
  conceallevel = 0,

  -- Undo
  undofile = true,

  -- Markdown stuff
}

-- Apply options
for k, v in pairs(options) do
  vim.opt[k] = v
end
