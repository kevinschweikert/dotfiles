-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands
--
local function augroup(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local bufnr = args.buf

    if not pcall(vim.treesitter.start, bufnr) then return end

    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"

    -- Treesitter-based indentation (experimental, provided by nvim-treesitter)
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "oil",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "gitsigns-blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function() vim.opt_local.conceallevel = 0 end,
})

-- Restore session on nvim open
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = augroup("restore_session"),
-- 	callback = function()
-- 		local status, persistence = pcall(require, "persistence")
-- 		if status then
-- 			persistence.load()
-- 		else
-- 			vim.notify("Persistence plugin not found", vim.log.levels.WARN)
-- 		end
-- 	end,
-- 	nested = true,
-- })

-- Create custom command for session restore
vim.api.nvim_create_user_command("RestoreSession", function()
  -- Use vim.defer_fn to ensure plugins are loaded
  vim.defer_fn(function()
    local status, persistence = pcall(require, "persistence")
    if status then
      persistence.load()
    else
      vim.notify("Persistence plugin not found", vim.log.levels.WARN)
    end
  end, 100) -- 100ms delay to ensure lazy loading is complete
end, { desc = "Restore session using persistence" })

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then vim.cmd("checktime") end
  end,
})

vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
  group = augroup("show_q_macro"),
  callback = function() vim.notify("Recording @" .. vim.fn.reg_recording()) end,
})

vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
  group = augroup("hide_q_macro"),
  callback = function() vim.notify("Stopped recording @" .. vim.fn.reg_recording()) end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("lsp"),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    if client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
    if client:supports_method("textDocument/documentColor") and vim.version().minor > 11 then
      vim.lsp.document_color.enable(true, ev.buf)
    end
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
})
