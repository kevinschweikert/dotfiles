return {
	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				tmux = { enabled = true },
				kitty = {
					enabled = true,
					font = "+0", -- font size increment
				},
			},
		},
		keys = {
			{
				"<leader>z",
				function()
					require("zen-mode"):toggle()
				end,
				desc = "Zen Mode",
			},
		},
	},
	-- {
	-- 	"folke/twilight.nvim",
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- },
}
