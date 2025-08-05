-- ~/.config/nvim/snippets/markdown.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("style", {
    t({
      "<style>",
      "  body {",
      '    font-family: "Segoe UI", sans-serif;',
      "    font-size: 12px",
      "    background-color: #fefefe;",
      "    color: #222222;",
      "  }",
      "</style>",
      "",
    }),
  }),

  s("table", {
    t({
      "| Column A | Column B |",
      "|----------|----------|",
      "| Value 1  | Value 2  |",
      "",
    }),
  }),

  s("meta", {
    t({ "---", "title: " }),
    i(1, "My Note"),
    t({ "", "tags: [" }),
    i(2, "tag1, tag2"),
    t({ "]", "---", "" }),
  }),
}
