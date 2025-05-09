-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VeryLazy'
--
-- which loads which-key after all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		-- event = "VeryLazy", -- Sets the loading event to 'VeryLazy'
		event = "VimEnter", -- Sets the loading event to 'VeryLazy'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup({
				triggers = {
					{ "<auto>", mode = "nixsotc" },
					{ "s", mode = { "n", "v" } },
				},
			})

			-- Document existing key chains
			require("which-key").add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>s_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
				{ "<leader>o", group = "[O]bsidian" },
				{ "<leader>_", hidden = true },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
