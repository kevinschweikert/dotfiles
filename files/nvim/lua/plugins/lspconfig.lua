return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			{
				"williamboman/mason.nvim",
				keys = {
					{ "<leader>m", ":Mason<CR>", desc = "Open Mason" },
				},
			},
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
		},
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself
					-- many times.
					--
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("K", vim.lsp.buf.hover, "Hover Documentation")
					-- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					-- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- map("gtd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					-- map("gds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- maequire("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					map("gd", function()
						require("fzf-lua").lsp_definitions({ jump_to_single_result = true, ignore_current_line = true })
					end, "Find LSP Definition")
					map("gr", function()
						require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
					end, "Find Reference")
					map("gI", function()
						require("fzf-lua").lsp_implementations({
							jump_to_single_result = true,
							ignore_current_line = true,
						})
					end, "Find Implementation")
					map("gy", function()
						require("fzf-lua").lsp_typedefs({ jump_to_single_result = true, ignore_current_line = true })
					end, "Find Type Definitions")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end

					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP Specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			local servers = {
				ansiblels = {},
				docker_compose_language_service = {},
				dockerls = {},
				elixirls = {},
				emmet_language_server = {
					filetypes = {
						"astro",
						"css",
						"eelixir",
						"elixir",
						"eruby",
						"heex",
						"html",
						"htmldjango",
						"javascriptreact",
						"less",
						"pug",
						"sass",
						"scss",
						"svelte",
						"typescriptreact",
						"vue",
					},
				},
				html = {},
				jsonls = {},
				pyright = {},
				ruff_lsp = {},
				rust_analyzer = {},
				biome = { single_file_support = true },
				tailwindcss = {
					filetypes = { "html", "elixir", "eelixir", "heex" },
					init_options = {
						userLanguages = {
							elixir = "html-eex",
							eelixir = "html-eex",
							heex = "html-eex",
						},
					},
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									'class[:]\\s*"([^"]*)"',
								},
							},
						},
					},
				},
				terraformls = {},
				yamlls = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
