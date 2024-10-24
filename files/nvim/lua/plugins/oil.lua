-- vim: ts=2 sts=2 sw=2 et
return {
	{
		"stevearc/oil.nvim",
		-- event = { "VeryLazy" },
		opts = {
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".."
				end,
			},
			win_options = {
				wrap = true,
			},
			float = {
				max_width = 100,
				max_height = 30,
			},
			keymaps = {
				["<C-y>"] = "actions.yank_entry",
			},
		},
		-- Optional dependencies
		dependencies = { "echasnovski/mini.icons" },
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		submodules = false, -- not needed, submodules are required only for tests
		opts = {},
	},
}
