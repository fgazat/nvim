-- require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
    s("ife", fmt("if err := {}; err != nil {{\
    return {}\
}}", { i(1), i(0) })),
    s("iflen", fmt("if len({}) != 0 {{\
    {}\
}}", { i(1), i(0) })),
})


