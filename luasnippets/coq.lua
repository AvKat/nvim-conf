local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

function special_sym(trig, sym)
  return s({
    trig = string.format(";%s", trig),
    snippetType = "autosnippet",
    regTrig = true
  }, {
    t { sym }
  })
end

return {
  special_sym("G", "Γ"),
  special_sym("D", "Δ"),
  special_sym("T", "Θ"),
  -- well-formedness
  special_sym("cse", "⊢ₛ"),
  special_sym("typ", "⊢"),
  -- set theory
  special_sym("in", "∈"),
  special_sym("nin", "∉"),
  special_sym("brack", "⟨⟩"),
  s({
    trig = ";St",
    snippetType = "autosnippet",
  }, fmt([[
    ⟨ <> | <> | <> ⟩
  ]], {
    i(1), i(2), i(3)
  }, {
    delimiters = "<>"
  })),
}
