
-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
    "elixir",
    "c_sharp",
    "diff",
    "eex",
    "fish",
    "git_rebase",
    "gitattributes",
    "go",
    "heex",
    "http",
    "python",
    "rust",
    "sql",
    "svelte",
    "toml",
	},
	-- auto install above language parsers
	auto_install = true,
})
