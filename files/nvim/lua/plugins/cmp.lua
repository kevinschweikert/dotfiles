return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		-- dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- On musl libc based systems you need to add this flag
		-- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

		opts = {
			keymap = {
				show = "<C-space>",
				hide = "<C-e>",
				accept = "<C-y>",
				select_prev = { "<Up>", "<C-p>" },
				select_next = { "<Down>", "<C-n>" },

				show_documentation = "<C-space>",
				hide_documentation = "<C-space>",
				scroll_documentation_up = "<C-b>",
				scroll_documentation_down = "<C-f>",

				snippet_forward = "<Tab>",
				snippet_backward = "<S-Tab>",
			},
			-- sources = {
			-- 	-- similar to nvim-cmp's sources, but we point directly to the source's lua module
			-- 	-- multiple groups can be provided, where it'll fallback to the next group if the previous
			-- 	-- returns no completion items
			-- 	-- WARN: This API will have breaking changes during the beta
			-- 	providers = {
			-- 		{
			-- 			{ "blink.cmp.sources.lsp", keyword_length = 2 },
			-- 			{ "blink.cmp.sources.path" },
			-- 		},
			-- 		{
			-- 			{ "blink.cmp.sources.buffer" },
			-- 			{ "blink.cmp.sources.snippets", score_offset = -3 },
			-- 		},
			-- 	},
			-- },
			highlight = {
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = true,
			},
			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
			-- experimental auto-brackets support
			accept = { auto_brackets = { enabled = true } },
			-- experimental signature help support
			trigger = { signature_help = { enabled = true } },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
