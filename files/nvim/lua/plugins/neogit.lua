return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			-- "nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		opts = {},
		keys = {
			{
				"<leader>n",
				function()
					require("neogit").open()
				end,
				desc = "Neogit",
			},
		},
	},
}
