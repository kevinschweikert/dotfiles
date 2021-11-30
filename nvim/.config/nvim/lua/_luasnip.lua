local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


ls.snippets = {
    all = {
        snip({
            trig = "def",
            namr = "Fuction [elixir]",
            dscr = "Elixir function"
        },
        {
          text("def "), insert(1, "name"), text("("), insert(2, "params"), text({") do", ""}),
          insert(3, ""), text({"",
        "end"})
        })
    }
}

