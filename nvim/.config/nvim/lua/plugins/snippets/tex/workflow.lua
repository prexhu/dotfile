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
tex.in_tikzzone = function()
  local is_inside = vim.fn["vimtex#env#is_inside"]("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex.in_text = function()
  return not tex.in_mathzone
end
ls.config.setup({ enable_autosnippets = true })
ls.add_snippets("tex", {
  s({ trig = "workflow", snippetType = "autosnippet" }, {
    t({
      "%\\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=red!30]",
      "",
    }),
    t({
      "%\\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=blue!30]",
      "",
    }),
    t({
      "%\\tikzstyle{process} = [rectangle, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=orange!30]",
      "",
    }),
    t({
      "%\\tikzstyle{decision} = [diamond, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=green!30]",
      "",
    }),
    t({ "%\\tikzstyle{arrow} = [thick]", "" }),
    t({ "\\begin{center}", "" }),
    t({ "\\begin{tikepicture}", "" }),
    t(""),
    t({ "%\\node (label) [Node Style] {Text in node}", "" }),
    i(1),
    t({ "\\end{tikepicture}", "" }),
    t({ "\\end{center}", "" }),
  }, { conditions = tex.in_text }),
})
--ls.add_snippets("tex", {
--  s(
--    { trig = "node", snippetType = "autosnippet" },
--    fmt(
--      [[
--    \node (<>) [<>] {<>}
--    ]],
--      {
--        i(1, "lable"),
--        i(2, "oritation"),
--        i(3, "text in node"),
--      },
--      { delimiter = "<>" },
--      { conditions = tex.in_tikzzone }
--    )
--  ),
--})
