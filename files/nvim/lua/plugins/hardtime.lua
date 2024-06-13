return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			max_count = 10,
			disable_mouse = false,
			restricted_keys = {
				["j"] = {},
				["k"] = {},
			},
		},
	},
}
