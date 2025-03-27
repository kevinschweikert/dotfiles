return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason" },
		keys = { { "<leader>m", ":Mason<CR>", desc = "Open Mason" } },
	},
	{ "j-hui/fidget.nvim", opts = {} },
}
