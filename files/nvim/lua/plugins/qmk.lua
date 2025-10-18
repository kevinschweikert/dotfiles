return {
	{
		"codethread/qmk.nvim",
		enabled = false,
		config = function()
			---@type qmk.UserConfig
			require("qmk").setup({
				name = "meh",
				auto_format_pattern = "*.keymap",
				layout = {
					"x x x x x x x x x x x x",
					"x x x x x x x x x x x x",
					"x x x x x x x x x x x x",
					"_ _ _ x x x x x x _ _ _",
				},
				variant = "zmk",
			})
		end,
	},
}
