local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
local tex = {}
tex.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
  return not tex.in_mathzone()
end
ls.config.setup({ enable_autosnippets = true })
ls.add_snippets("tex", {
  s({ trig = "sin", snippetType = "autosnippet" }, {
    t("sin("),
    i(1),
    t(")"),
    i(2),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "cos", snippetType = "autosnippet" }, {
    t("cos("),
    i(1),
    t(")"),
    i(2),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "tan", snippetType = "autosnippet" }, {
    t("tan("),
    i(1),
    t(")"),
    i(2),
  }, { condition = tex.in_mathzone }),
})

ls.add_snippets("tex", {
  s({ trig = "sub", dirc = "Subscript", snippetType = "autosnippet", wordTrig = false, regTrig = false }, {
    t("_{"),
    i(1),
    t("}"),
    i(2),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "sup", dirc = "Superscript", snippetType = "autosnippet", wordTrig = false, regTrig = false }, {
    t("^{"),
    i(1),
    t("}"),
    i(2),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "lim", dirc = "Function or Array Limit", snippetType = "autosnippet", wordTrig = true }, {
    t("\\lim\\limits_{"),
    i(1),
    t("\\to "),
    i(2),
    t("}"),
    i(3),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "fx", dirc = "Fast f(x)", snippetType = "autosnippet" }, {
    t("f(x)"),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "sum", dirc = "Fast Sum", snippetType = "autosnippet", wordTrig = true }, {
    t("\\sum\\limits_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
    i(3),
  }, { condition = tex.in_mathzone }),
})

--ls.add_snippets("tex", {
--  s({ trig = "begg", dirc = "Fast expand for no count equation", snippetType = "autosnippet" }, {
--    t({ "\\begin{equation*}", "" }),
--    i(1),
--    t({ "", "" }),
--    t("\\end{equation*}"),
--  }),
--})
ls.add_snippets("tex", {
  s({ trig = "bt", dirc = "fast expand for beta", snippetType = "autosnippet" }, {
    t("\\beta"),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "ap", dirc = "fast expand for alpha", snippetType = "autosnippet" }, {
    t("\\alpha"),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "epsl", dirc = "fast expand for varepsilon", snippetType = "autosnippet" }, {
    t("\\varepsilon"),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "vec", snippetType = "autosnippet" }, {
    t("\\vec{"),
    i(1),
    t("}"),
    i(2),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "abs", dirc = "fast expand for absolute value", snippetType = "autosnippet" }, {
    t("\\lvert "),
    i(1),
    t(" \\rvert"),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "ff", dirc = "fast expand for fractioin", snippetType = "autosnippet" }, {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(0),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "sqt", dirc = "fast expand for sqrt", snippetType = "autosnippet" }, {
    t("\\sqrt{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = tex.in_mathzone }),
})
ls.add_snippets("tex", {
  s({ trig = "sqnt", dirc = "fast expand for N sqrt", snippetType = "autosnippet" }, {
    t("\\sqrt["),
    i(1),
    t("]{"),
    i(2),
    t("}"),
    i(0),
  }, { condition = tex.in_mathzone }),
})
