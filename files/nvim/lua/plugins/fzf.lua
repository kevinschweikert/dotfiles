return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	-- config = function(_, _)
	-- 	require("fzf-lua").setup({
	-- 		keymap = {
	-- 			fzf = {
	-- 				["ctrl-q"] = "select-all+accept",
	-- 			},
	-- 		},
	-- 	})
	-- 	require("fzf-lua.providers.ui_select").register()
	-- end,
	opts = {
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept",
			},
		},
	},
	keys = {
		{ "<leader><leader>", "<cmd>lua require('fzf-lua').files()<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "Find word" },
		{ "<leader>f.", "<cmd>lua require('fzf-lua').oldfiles()<cr>", desc = "Find recent files" },
		{ "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>", desc = "Find buffers" },
		{ "<leader>/", "<cmd>lua require('fzf-lua').grep_curbuf()<cr>", desc = "Find in current buffer" },
	},
}
