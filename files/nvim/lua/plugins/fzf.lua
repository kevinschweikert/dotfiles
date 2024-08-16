return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{ "<leader><leader>", "<cmd>lua require('fzf-lua').files()<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "Find word" },
		{ "<leader>f.", "<cmd>lua require('fzf-lua').oldfiles()<cr>", desc = "Find recent files" },
		{ "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>", desc = "Find buffers" },
		{ "<leader>/", "<cmd>lua require('fzf-lua').grep_curbuf()<cr>", desc = "Find in current buffer" },
	},
}
