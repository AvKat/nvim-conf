return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")

    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local fmt = require("luasnip.extras.fmt").fmt

    ls.setup({
      enable_autosnippets = true,
    })

    require("luasnip.loaders.from_lua").load({ paths = "./luasnippets" })

    vim.keymap.set({ "i" }, "<C-i>", function()
      ls.expand()
    end, {})
  end
}
