-- key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = false -- enable line wrap
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- indentation
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shiftround = true -- Round indent
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.breakindent = true -- Enable break indent
vim.opt.linebreak = true -- enable line wrap
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.expandtab = true -- Use spaces instead of tabs

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- visual
vim.g.have_nerd_font = true
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup", "fuzzy", "preview", "noselect" }
vim.opt.showmode = false
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.winblend = 10 -- window blend
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.list = false
vim.opt.laststatus = 3 -- global statusline
vim.opt.winborder = "rounded" -- Use rounded borders for windows

-- file handling
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding
-- vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

-- split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- diffing
vim.opt.diffopt:append("linematch:40,algorithm:patience,indent-heuristic")

-- command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" } -- Command-line completion mode

-- tabs
vim.opt.showtabline = 1
vim.opt.tabline = ""

vim.opt.complete = { "o", "." }
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.formatoptions = "jcroqlnt" -- tcqj
-- formatoptions = "jcroqlnt"
-- j: Remove comment leader when joining lines (intelligent comment handling)
-- c: Auto-wrap comments using textwidth, inserting comment leader automatically
-- r: Automatically insert comment leader after <Enter> in Insert mode
-- o: Automatically insert comment leader after 'o' or 'O' in Normal mode
-- q: Allow formatting of comments with "gq" command
-- l: Long lines are not broken in insert mode (if line was long when entering insert mode)
-- n: Recognize numbered lists when formatting text (handles indentation properly)
-- t: Auto-wrap text using textwidth (but you likely don't have textwidth set)
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep -uu"
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "skiprtp",
  "folds",
  "terminal",
}
-- I: Don't show intro
-- c: don't give ins-completion messages
-- C: don't give messages while scanning for ins-completions
-- W	don't give "written" or "[w]" when writing a file
vim.opt.shortmess:append({ W = true, c = true, C = true })
vim.opt.spelllang = { "en" }
vim.opt.splitkeep = "screen"
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.winminwidth = 5 -- Minimum window width

vim.filetype.add({ extension = { livemd = "markdown" } })
