vim.opt_local.makeprg = "mix test --stale --no-color --max-failures=10"

vim.opt_local.errorformat = table.concat({
	-- Modern Elixir warnings: └─ lib/file.ex:101:33: Module.function/2
	-- Use %*[└─ ] to match and ignore the prefix
	"%W%*[└─ ]%f:%l:%c: %m", -- Warnings with column
	"%W%*[└─ ]%f:%l: %m", -- Warnings without column

	-- ExUnit test failures: file.exs:6
	"%E%f:%l", -- Test failure locations
	"%E%f:%l: %m", -- General errors

	-- Exception errors
	"%E** (%s) %f:%l: %m", -- Exception format

	-- Ignore noise
	"%-G%*[%s]warning: %m", -- Skip warning description lines
	"%-G%*[%s]│%m", -- Skip box drawing
	"%-G%*[%s]%*[%d] │%m", -- Skip numbered lines with boxes
	"%-G%*[%s]%*[%~]", -- Skip underline decorations
	"%-G%*[.]", -- Skip progress dots
	"%-G", -- Skip everything else
}, ",")

vim.opt_local.commentstring = "# %s"
vim.opt_local.suffixesadd = ".ex,.exs"
