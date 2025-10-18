vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
})

local parsers = {
  "bash",
  "c",
  "c_sharp",
  "caddy",
  "cmake",
  "comment",
  "cpp",
  "css",
  "csv",
  "diff",
  "eex",
  "elixir",
  "erlang",
  "fish",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "gitignore",
  "gleam",
  "go",
  "heex",
  "html",
  "http",
  "hurl",
  "ini",
  "javascript",
  "jq",
  "jsdoc",
  "json",
  "jsonc",
  "kitty",
  "lua",
  "luadoc",
  "luap",
  "make",
  "markdown",
  "markdown_inline",
  "nginx",
  "powershell",
  "python",
  "query",
  "regex",
  "requirements",
  "rust",
  "scss",
  "sql",
  "ssh_config",
  "svelte",
  "terraform",
  "tmux",
  "toml",
  "typescript",
  "typst",
  "vim",
  "vimdoc",
  "yaml",
}
-- Autoinstall languages that are not installed
-- 	auto_install = true,
-- 	highlight = { enable = true },
-- 	indent = { enable = true },
-- })
-- require("nvim-treesitter.install").prefer_git = true
--
local nts = require("nvim-treesitter")
nts.install(parsers)

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
      vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
      nts.update()
    end
  end,
})
