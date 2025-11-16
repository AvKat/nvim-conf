local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local date = function() return { os.date('%m/%d') } end

return {
  s({
    trig = "date",
    name = "Date",
    dscr = "Date in the form of MM/DD",
  }, {
    f(date, {}),
  }),
}
