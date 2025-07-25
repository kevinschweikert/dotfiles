return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("tokyonight-moon")

			-- You can configure highlights by doing something like
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("oldworld")

			-- You can configure highlights by doing something like
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
			})
			-- Load the colorscheme here
			vim.cmd.colorscheme("catppuccin-mocha")

			-- You can configure highlights by doing something like
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
