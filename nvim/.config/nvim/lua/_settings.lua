-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '100'        -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.cursorline = true
opt.scrolloff = 8
opt.incsearch = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.autoread = true
opt.undofile = true
opt.backup = false

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
cmd [[colorscheme onedark]]
opt.termguicolors = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.showtabline = 2
opt.smartindent = true
opt.smarttab = true
opt.autoindent = true

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

vim.cmd('filetype plugin indent on')
vim.bo.syntax = "on"

vim.cmd([[
filetype plugin indent on
autocmd FileType yaml setl indentkeys-=<:>
]])
