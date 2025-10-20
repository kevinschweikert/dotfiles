vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local function toggle_diagnostics()
  local enabled = vim.diagnostic.is_enabled()
  if enabled then
    vim.notify("disabled diagnostics")
    vim.diagnostic.enable(not enabled)
  else
    vim.notify("enabled diagnostics")
    vim.diagnostic.enable(not enabled)
  end
end

vim.keymap.set("n", "Y", "y$", { desc = "yank until end of line" })

-- Quickfix keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>copen<cr>", { desc = "Show diagnostic [E]rror messages" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>td", toggle_diagnostics, { desc = "[T]oggle [D]iagnostics" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center after half page jump" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center after half page jump" })

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format" })

vim.keymap.set("n", "<leader>pu", function() vim.pack.update() end, { desc = "Update packages" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
--
-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- fzf
vim.keymap.set(
  "n",
  "<leader><space>",
  function() require("fzf-lua").files({ formatter = { "path.filename_first", 2 } }) end,
  { desc = "Find files" }
)
vim.keymap.set("n", "<leader>r", ":FzfLua resume<cr>", { desc = "Resume picker" })
vim.keymap.set("n", "<leader>/", ":FzfLua live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>ss", ":FzfLua lsp_document_symbols<cr>", { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>sS", ":FzfLua lsp_workspace_symbols<cr>", { desc = "Find workspace symbols" })

-- persistence
vim.keymap.set("n", "<leader>ql", function() require("persistence").load() end)
vim.keymap.set("n", "<leader>qs", function() require("persistence").select() end)

-- oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- gx
vim.keymap.set("n", "gx", "<Cmd>Browse<cr>", { desc = "Browse file/url" })

-- conform
vim.keymap.set(
  "n",
  "<leader>f",
  function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
  { desc = "Conform format" }
)

-- mason
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<cr>", { desc = "Open Mason" })

-- neogit
vim.keymap.set("n", "<leader>n", function() require("neogit").open() end, { desc = "Open Neogit" })

vim.keymap.set({ "n", "v" }, "<Up>", "gk", { desc = "Move up a screenline" })
vim.keymap.set({ "n", "v" }, "<Down>", "gj", { desc = "Move down a screenline" })

vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
vim.keymap.set("i", "C-u", "<C-g>u<C-u>", { noremap = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { noremap = true })
