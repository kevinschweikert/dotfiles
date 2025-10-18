return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			-- "sindrets/diffview.nvim", -- optional - Diff integration
			-- "nvim-tree/nvim-web-devicons",

			-- Only one of these is needed, not both.
			-- "nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",
			-- "folke/snacks.nvim",
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
