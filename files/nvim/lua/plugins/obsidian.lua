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
		cmd = {
			"ObsidianOpen",
			"ObsidianNew",
			"ObsidianQuickSwitch",
			"ObsidianFollowLink",
			"ObsidianBacklinks",
			"ObsidianTags",
			"ObsidianToday",
			"ObsidianYesterday",
			"ObsidianTomorrow",
			"ObsidianDailies",
			"ObsidianTemplate",
			"ObsidianSearch",
			"ObsidianLink",
			"ObsidianLinkNew",
			"ObsidianLinks",
			"ObsidianExtractNote",
			"ObsidianWorkspace",
			"ObsidianPasteImg",
			"ObsidianRename",
			"ObsidianToggleCheckbox",
			"ObsidianNewFromTemplate",
			"ObsidianTOC",
		},
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
			disable_frontmatter = false,
			-- use title instead of spec.id
			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.title)
				return path:with_suffix(".md")
			end,
			note_id_func = function(title)
				return title
			end,
			-- in favour of render markdown plugin
			ui = { enable = false },
			picker = {
				-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
				name = "fzf-lua",
				-- Optional, configure key mappings for the picker. These are the defaults.
				-- Not all pickers support all mappings.
				note_mappings = {
					-- Create a new note from your query.
					new = "<C-x>",
					-- Insert a link to the selected note.
					insert_link = "<C-l>",
				},
				tag_mappings = {
					-- Add tag(s) to current note.
					tag_note = "<C-x>",
					-- Insert a tag at the current location.
					insert_tag = "<C-l>",
				},
			},
		},
	},
}
