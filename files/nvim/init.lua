-- vim: ts=2 sts=2 sw=2 et

vim.loader.enable()
require("vim._extui").enable({}) -- https://github.com/neovim/neovim/pull/27855

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

require("lsp")
require("options")
require("keymaps")
require("autocmds")
require("commands")
require("statusline")

require("plugins.catppuccin")
require("plugins.comments")
require("plugins.conform")
require("plugins.fidget")
require("plugins.fzf")
require("plugins.kitty")
require("plugins.mason")
require("plugins.neogit")
require("plugins.oil")
require("plugins.persistence")
require("plugins.sleuth")
require("plugins.todo-comments")
require("plugins.treesitter")
require("plugins.typst-preview")
