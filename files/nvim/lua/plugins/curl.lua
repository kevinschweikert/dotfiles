return {
	"oysandvik94/curl.nvim",
	cmd = { "CurlOpen" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>cq",
			function()
				require("curl").close_curl_tab()
			end,
			{ desc = "Closes the curl tab" },
		},
		{
			"<leader>cc",
			function()
				require("curl").open_curl_tab()
			end,
			{ desc = "Open a curl tab scoped to the current working directory" },
		},
		{
			"<leader>co",
			function()
				require("curl").open_global_tab()
			end,
			{ desc = "Open a curl tab with gloabl scope" },
		},
		-- These commands will prompt you for a name for your collection
		{
			"<leader>csc",
			function()
				require("curl").create_scoped_collection()
			end,
			{ desc = "Create or open a collection with a name from user input" },
		},
		{
			"<leader>cgc",
			function()
				require("curl").create_global_collection()
			end,
			{ desc = "Create or open a global collection with a name from user input" },
		},
		{
			"<leader>fsc",
			function()
				require("curl").pick_scoped_collection()
			end,
			{ desc = "Choose a scoped collection and open it" },
		},
		{
			"<leader>fgc",
			function()
				require("curl").pick_global_collection()
			end,
			{ desc = "Choose a global collection and open it" },
		},
	},
	config = true,
}
