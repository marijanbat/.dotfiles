local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("PHP Snippets", {clear = true})
local file_pattern = "*.php"

local php_snip = s("php_snip", {t"Hi this is snip"})
table.insert(snippets, php_snip)
