return {
	"tpope/vim-projectionist",
	event = "VeryLazy",
	keys = {
		{ "<leader>aa", ":A<CR>", desc = "Projectionist Alternate File" },
		{ "<leader>av", ":AV<CR>", desc = "Projectionist Alternate File in Split" },
	},
	config = function()
		vim.g.projectionist_heuristics = {
			["*"] = {
				["lib/**/live/*_live.ex"] = {
					type = "view",
					alternate = "test/{dirname}/live/{basename}_live_test.exs",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
						"  use {dirname|camelcase|capitalize}, :live_view",
						"end",
					},
				},
				["test/**/live/*_live_test.exs"] = {
					alternate = "lib/{dirname}/live/{basename}_live.ex",
					type = "test",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}LiveTest do",
						"  use ExUnit.Case, async: true",
						"",
						"  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live",
						"end",
					},
				},
				["lib/**/views/*_view.ex"] = {
					type = "view",
					alternate = "test/{dirname}/views/{basename}_view_test.exs",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View do",
						"  use {dirname|camelcase|capitalize}, :view",
						"end",
					},
				},
				["test/**/views/*_view_test.exs"] = {
					alternate = "lib/{dirname}/views/{basename}_view.ex",
					type = "test",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ViewTest do",
						"  use ExUnit.Case, async: true",
						"",
						"  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}View",
						"end",
					},
				},
				["lib/**/controllers/*_controller.ex"] = {
					type = "controller",
					alternate = "test/{dirname}/controllers/{basename}_controller_test.exs",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Controller do",
						"  use {dirname|camelcase|capitalize}, :controller",
						"end",
					},
				},
				["test/**/controllers/*_controller_test.exs"] = {
					alternate = "lib/{dirname}/controllers/{basename}_controller.ex",
					type = "test",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ControllerTest do",
						"  use {dirname|camelcase|capitalize}.ConnCase, async: true",
						"end",
					},
				},
				["lib/**/channels/*_channel.ex"] = {
					type = "channel",
					alternate = "test/{dirname}/channels/{basename}_channel_test.exs",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel do",
						"  use {dirname|camelcase|capitalize}, :channel",
						"end",
					},
				},
				["test/**/channels/*_channel_test.exs"] = {
					alternate = "lib/{dirname}/channels/{basename}_channel.ex",
					type = "test",
					template = {
						"defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ChannelTest do",
						"  use {dirname|camelcase|capitalize}.ChannelCase, async: true",
						"",
						"  alias {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Channel",
						"end",
					},
				},
				["lib/*.ex"] = {
					alternate = "test/{}_test.exs",
					type = "source",
					template = {
						"defmodule {camelcase|capitalize|dot} do",
						"end",
					},
				},
				["test/*_test.exs"] = {
					alternate = "lib/{}.ex",
					type = "test",
					template = {
						"defmodule {camelcase|capitalize|dot}Test do",
						"  use ExUnit.Case, async: true",
						"",
						"  alias {camelcase|capitalize|dot}",
						"end",
					},
				},
			},
		}
	end,
}
