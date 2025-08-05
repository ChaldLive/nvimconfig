local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic HTML5 Boilerplate
  s("html5", {
    t({
      "<!DOCTYPE html>",
      '<html lang="en">',
      "<head>",
      '  <meta charset="UTF-8">',
      '  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
      "  <title>",
    }),
    i(1, "Document"),
    t({
      "</title>",
      "</head>",
      "<body>",
    }),
    i(2, ""),
    t({
      "",
      "</body>",
      "</html>",
    }),
  }),

  -- Anchor tag
  s("a", {
    t('<a href="'),
    i(1, "https://example.com"),
    t('">'),
    i(2, "Link Text"),
    t("</a>"),
  }),

  -- Image tag
  s("img", {
    t('<img src="'),
    i(1, "image.jpg"),
    t('" alt="'),
    i(2, "description"),
    t('" />'),
  }),

  -- Paragraph
  s("p", {
    t("<p>"),
    i(1, "Text here..."),
    t("</p>"),
  }),

  -- Div with class
  s("divc", {
    t('<div class="'),
    i(1, "container"),
    t('">'),
    t({ "", "  " }),
    i(2, "Content"),
    t({ "", "</div>" }),
  }),

  -- Button
  s("btn", {
    t('<button type="'),
    i(1, "button"),
    t('">'),
    i(2, "Click me"),
    t("</button>"),
  }),

  -- Input field
  s("input", {
    t('<input type="'),
    i(1, "text"),
    t('" name="'),
    i(2, "name"),
    t('" placeholder="'),
    i(3, "Enter text"),
    t('" />'),
  }),

  -- Form
  s("form", {
    t('<form action="'),
    i(1, "/submit"),
    t('" method="'),
    i(2, "post"),
    t('">'),
    t({ "", "  " }),
    i(3, '<input type="text" name="name" />'),
    t({ "", '  <button type="submit">' }),
    i(4, "Send"),
    t("</button>"),
    t({ "", "</form>" }),
  }),

  -- Unordered list
  s("ul", {
    t({ "<ul>", "  <li>" }),
    i(1, "Item 1"),
    t({ "</li>", "  <li>" }),
    i(2, "Item 2"),
    t({ "</li>", "</ul>" }),
  }),

  -- HTML comment
  s("com", {
    t("<!-- "),
    i(1, "comment"),
    t(" -->"),
  }),
}
