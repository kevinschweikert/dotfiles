-- vim: ts=2 sts=2 sw=2 et
return {
	{
		"stevearc/oil.nvim",
		-- event = { "VeryLazy" },
		opts = {
			default_file_explorer = true,
			float = {
				max_width = 100,
				max_height = 30,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
