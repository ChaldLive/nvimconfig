This** is the basic config of nvim from which new branches will emerge.
All the basic plugins and git repos will be listed, accompanied by the keymappings for them.
And of course, all the external repos and resources, used as well.

Treesitter for general purpose url:
<https://github.com/nvim-treesitter/nvim-treesitter>

Treesitter-textobjects url:
<https://github.com/nvim-treesitter/nvim-treesitter-textobjects>

This is, by the way, a dependency in the treesitter.lua generally. This plugin may, over time, prove to be
one of the most valuable tools for enhancing and compiling a personal collection of macros, automating all
the repetitive, time-consuming tasks.

Telescope url:
<https://github.com/nvim-telescope/telescope.nvim>

Registers url:
<https://github.com/tversteeg/registers.nvim>
A need helper in a bad day of coding.

None url:
<nhttps://github.com/nvimtools/none-ls.nvim>

Noice url:
<https://github.com/folke/noice.nvim>

Neotree url:
<https://github.com/nvim-neo-tree/neo-tree.nvim>
A lot of dependencies are associated with this tree

<https://github.com/nvim-lua/plenary.nvim>
<https://github.com/MunifTanjim/nui.nvim>
<https://github.com/kyazdani42/nvim-web-devicons> -- optional, for file icons

Lualine url:
<https://github.com/nvim-lualine/lualine.nvim>

 Dependency worth noticing in the lualine thing.
<https://github.com/nvim-tree/nvim-web-devicons>

lps-config url: It is an array of configs depending on eachother

<https://github.com/williamboman/mason.nvim>
<https://github.com/williamboman/mason-lspconfig.nvim>
<https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim>

Added this plugin for full support of Rust featuring debugging etc:
 Debugging

* Zero config: No need to manually set up rust-analyzer or lspconfig—it just works.
* Hover actions: Inline docs, type hints, and actionable popups.
* Code actions: Grouped and categorized, with a UI overlay.
* Debugging: Integrates with nvim-dap and codelldb for full Rust debugging.
* Test runners: Background test execution with diagnostics.
* Crate graph & syntax tree: Visualize your project structure.
* Neotest integration: Built-in adapter for test discovery and execution.

## 🔗 Table of Contents

* [🧠 General Keymaps](#general-keymaps)
* [✨ Treesitter Text Objects](#treesitter-text-objects)
  * [🔹 Selection](#selection)
  * [🔹 Movement](#movement)
  * [🔹 Swap](#swap)
* [📝 Registers (`nvim-registers`)](#registers-nvim-registers)
* [🌲 Neo-tree Window Mappings](#neo-tree-window-mappings)
* [💬 Comment.nvim](#commentnvim)

---

<details>
<summary id="general-keymaps">🧠 General Keymaps</summary>

| Shortcut     | Mode   | Description                |
|--------------|--------|----------------------------|
| `<leader>u`  | Normal | Toggle Undotree            |
| `<leader>ff` | Normal | Find files via Telescope   |
| `<leader>fg` | Normal | Live grep via Telescope    |
| `<leader>fb` | Normal | Switch Telescope buffers   |
| `<leader>fh` | Normal | Open help tags in Telescope|

</details>

---

### ✨ Treesitter Text Objects

<details>
<summary id="selection">🔹 Selection</summary>

| Shortcut | Mode   | Description            |
|----------|--------|------------------------|
| `af`     | Visual | Select around function |
| `if`     | Visual | Select inner function  |
| `ac`     | Visual | Select around class    |
| `ic`     | Visual | Select inner class     |
| `ap`     | Visual | Select around param    |
| `ip`     | Visual | Select inner param     |

</details>

<details>
<summary id="movement">🔹 Movement</summary>

| Shortcut | Mode   | Description             |
|----------|--------|-------------------------|
| `]m`     | Normal | Next function start     |
| `]]`     | Normal | Next class start        |
| `[m`     | Normal | Previous function start |
| `[[`     | Normal | Previous class start    |

</details>

<details>
<summary id="swap">🔹 Swap</summary>

| Shortcut    | Mode   | Description                         |
|-------------|--------|-------------------------------------|
| `<leader>a` | Normal | Swap with next parameter (inner)    |
| `<leader>A` | Normal | Swap with previous parameter (inner)|

</details>

---

<details>
<summary id="registers-nvim-registers">📝 Registers (`nvim-registers`)</summary>

| Shortcut  | Mode         | Description             |
|-----------|--------------|-------------------------|
| `"`       | Normal/Visual| Open registers window   |
| `<C-R>`   | Insert       | Insert from register    |

</details>

---

<details>
<summary id="neo-tree-window-mappings">🌲 Neo-tree Window Mappings</summary>

| Shortcut | Mode   | Description   |
|----------|--------|---------------|
| `<CR>`   | Normal | Open node     |
| `l`      | Normal | Open node     |
| `h`      | Normal | Close node    |
| `r`      | Normal | Rename        |
| `d`      | Normal | Delete        |
| `n`      | Normal | Create        |
| `c`      | Normal | Copy          |
| `x`      | Normal | Cut           |
| `p`      | Normal | Paste         |

</details>

---

<details>
<summary id="commentnvim">💬 Comment.nvim</summary>

| Shortcut | Mode          | Description          |
|----------|---------------|----------------------|
| `gcc`    | Normal        | Toggle line comment  |
| `gbc`    | Normal        | Toggle block comment |
| `gc`     | Visual/Normal | Comment line(s)      |
| `gb`     | Visual/Normal | Comment block(s)     |

</details>
