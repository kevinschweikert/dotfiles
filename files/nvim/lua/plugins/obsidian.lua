return {
	-- install pngpaste with `brew install pngpaste`
	{
		"epwalsh/obsidian.nvim",
		version = "v3.9.0", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vaulto
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Obsidian Paste Image" },
			{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New" },
			{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Find" },
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kevin",
				},
			},
			note_id_func = function(title)
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					error("need a title")
				end
			end,
		},
	},
}
