local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("heex", {
	s("el", fmt("<%= {} %>{}", { i(1), i(0) })),
	s("ei", fmt("<%= if {} do %>\n\t{}<% end %>\n{}", { i(1), i(2), i(0) })),
	s("ef", fmt("<%= for {} <- {} do %>\n\t{}\n<% end %>{}", { i(1), i(2), i(3), i(0) })),
})

ls.add_snippets("elixir", {
	s("type", fmt("@type t() :: %__MODULE__{{\n\t{}\n}}{}", { i(1), i(0) })),
})
