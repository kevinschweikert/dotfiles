vim.pack.add( { "https://github.com/ibhagwan/fzf-lua", "https://github.com/echasnovski/mini.icons" })
		require("fzf-lua").setup({
		keymap = {
			fzf = {
				-- use cltr-q to select all items and convert to quickfix list
				["ctrl-q"] = "select-all+accept",
			},
		},
		previewers = {
			builtin = {
				-- fzf-lua is very fast, but it really struggled to preview a couple files
				-- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
				-- It turns out it was Treesitter having trouble parsing the files.
				-- With this change, the previewer will not add syntax highlighting to files larger than 100KB
				-- (Yes, I know you shouldn't have 100KB minified files in source control.)
				syntax_limit_b = 1024 * 100, -- 100KB
			},
		},
	})

		require("fzf-lua").register_ui_select()
