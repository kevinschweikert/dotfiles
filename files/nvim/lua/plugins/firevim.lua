return {
	{
		"glacambre/firenvim",
		lazy = not vim.g.started_by_firenvim,
		module = false,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
		-- runs before firenvim is loaded
		init = function()
			vim.g.firenvim_config = {
				localSettings = {
					[".*"] = {
						takeover = "never",
					},
				},
			}
			-- hide statusline in the browser
			if vim.g.started_by_firenvim then
				vim.o.laststatus = 0
			end
		end,
	},

	-- only load these when *not* in firenvim
	{ "noice.nvim", enabled = not vim.g.started_by_firenvim },
	{ "mini.statusline", enabled = not vim.g.started_by_firenvim },
	{ "folke/which-key.nvim", enabled = not vim.g.started_by_firenvim },
}
