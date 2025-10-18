-- vim: ts=2 sts=2 sw=2 et
vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/chrishrb/gx.nvim",
})

require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _) return name == ".." end,
  },
  win_options = {
    wrap = true,
    winblend = 0,
  },
  float = {
    padding = 2,
    max_width = 100,
    max_height = 30,
  },
  keymaps = {
    ["<C-y>"] = "actions.yank_entry",
  },
})

vim.g.netrw_nogx = 1 -- disable netrw gx
-- return
-- 	{
-- 		"stevearc/oil.nvim",
-- 		-- event = { "VeryLazy" },
-- 		lazy = false,
-- 		opts = {
-- 			default_file_explorer = true,
-- 			skip_confirm_for_simple_edits = true,
-- 			view_options = {
-- 				show_hidden = true,
-- 				natural_order = true,
-- 				is_always_hidden = function(name, _)
-- 					return name == ".."
-- 				end,
-- 			},
-- 			win_options = {
-- 				wrap = true,
-- 				winblend = 0,
-- 			},
-- 			float = {
-- 				padding = 2,
-- 				max_width = 100,
-- 				max_height = 30,
-- 			},
-- 			keymaps = {
-- 				["<C-y>"] = "actions.yank_entry",
-- 			},
-- 		},
-- 		-- Optional dependencies
-- 		dependencies = { "echasnovski/mini.icons" },
-- 	},
-- 	{
-- 		"chrishrb/gx.nvim",
-- 		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
-- 		cmd = { "Browse" },
-- 		init = function()
-- 			vim.g.netrw_nogx = 1 -- disable netrw gx
-- 		end,
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		submodules = false, -- not needed, submodules are required only for tests
-- 		opts = {},
-- 	},
-- }
