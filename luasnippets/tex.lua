local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s({
    trig = "mk",
    snippetType = "autosnippet",
  }, fmt([[
    $<>$
  ]], {
    i(1)
  }, {
    delimiters = "<>"
  })),

  s({
    trig = "begend",
    snippetType = "autosnippet",
  }, fmt([[
    \begin{<>}
      <>
    \end{<>}
  ]], {
    i(1), i(0), rep(1)
  }, {
    delimiters = "<>"
  })),
}
