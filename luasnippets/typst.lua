local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local language_autocomplete = function(trig, lang)
  return s({
    trig = string.format("^;%s", trig),
    snippetType = "autosnippet",
    regTrig = true
  }, fmt([[
```<>
<>
```
  ]], {
    t(lang),
    i(1)
  }, {
    delimiters = "<>"
  }))
end

local thm_envs = function(trig)
  return s({
    trig = string.format("^\\%s", trig),
    snippetType = "autosnippet",
    regTrig = true
  }, fmt([[
#<>[
  <>
]
<>
  ]], { t(trig), i(1), i(2) }, { delimiters = "<>" }))
end

return {
  s("template", fmt([[
#import "/Local Docs/scripts/template.typ" : *
#show: project.with(title: "<>")
  ]], {
    i(1, "title")
  }, {
    delimiters = "<>"
  })),

  s("template_with_outline", fmt([[
#import "/Local Docs/scripts/template.typ" : *
#show: projectOutline.with(title: "<>")
  ]], {
    i(1, "title")
  }, {
    delimiters = "<>"
  })),

  --   s("typcmd", fmt([[
  -- #let seq = $subset.eq$
  -- #let supeq = $supset.eq$
  -- #let sm = $backslash$
  -- #let iff = $<=>$
  -- #let bsq = $square.filled.big$
  -- #let nin = $in.not$
  -- #let pm = $plus.minus$
  -- #let u = underline
  -- #let RR = $bb(R)$
  -- #let Rn = $bb(R)^n$
  -- #let cyc(n) = $angle.l #n angle.r$
  -- #let th(n) = $#n^"th"$
  -- #let vc(x) = $limits(#x)^->$
  -- #let cong = $tilde.equiv$
  -- #let satisfies = $tack.double$
  -- #let larrow = $arrow.l.double$
  --   ]], {})),
  -- Math mode
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

  s("trig", {
    i(1), t "text", i(2), t "text again", i(3)
  }),
  language_autocomplete("rkt", "racket"),
  language_autocomplete("py", "python"),
  language_autocomplete("js", "javascript"),
  language_autocomplete("ts", "typescript"),
  language_autocomplete("c", "c"),
  language_autocomplete("cpp", "c++"),
  language_autocomplete("java", "java"),
  language_autocomplete("rs", "rust"),
  language_autocomplete("scala", "scala"),
  language_autocomplete("hs", "haskell"),
  thm_envs("def"),
  thm_envs("lem"),
  thm_envs("thm"),
  thm_envs("prp"),
}
