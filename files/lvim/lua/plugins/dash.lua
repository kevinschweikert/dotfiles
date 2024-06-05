return {
	{
		"mrjones2014/dash.nvim",
		build = "make install",
		opts = {
			search_engine = "google",
		},
		keys = {
			{ "<leader>dd", ":Dash<CR>", desc = "Dash" },
			{ "<leader>dw", ":DashWord<CR>", desc = "DashWord" },
		},
	},
}
