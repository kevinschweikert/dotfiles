return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			local spec_treesitter = require("mini.ai").gen_spec.treesitter
			require("mini.ai").setup({
				custom_textobjects = {
					F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
					B = spec_treesitter({ a = "@block.outer", i = "@block.inner" }),
				},
				n_lines = 500,
			})

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- local indentscope = require("mini.indentscope")
			-- indentscope.setup({
			-- 	draw = {
			-- 		animation = indentscope.gen_animation.none(),
			-- 	},
			-- })

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			statusline.setup()

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we disable the section for
			-- cursor information because line numbers are already enabled
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return ""
			end

			-- ... and there is mor!
			--  Check out: https://github.com/echasnovski/mini.nvim
			-- require("mini.starter").setup({
			-- 	-- removed "-" to call Oil in startup screen
			-- 	query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
			-- })
			-- require("mini.sessions").setup({
			-- 	autoread = true,
			-- 	autowrite = true,
			-- })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
