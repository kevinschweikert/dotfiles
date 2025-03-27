return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_marker = { ".git" },
	-- filetypes copied and adjusted from tailwindcss-intellisense
	filetypes = {
		-- html
		"django-html",
		"htmldjango",
		"eelixir", -- vim ft
		"elixir",
		"gohtml",
		"gohtmltmpl",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"markdown",
		"mdx",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		-- js
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
	},
	settings = {
		tailwindCSS = {
			includeLanguages = {
				eelixir = "html-eex",
				elixir = "html-eex",
				heex = "html-eex",
			},
		},
	},
}
