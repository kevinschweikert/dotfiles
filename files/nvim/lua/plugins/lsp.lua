return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason" },
		opts = {},
		keys = {
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Open Mason" },
		},
	},
	{ "j-hui/fidget.nvim", opts = {} },
}
