vim.lsp.enable({
  "biome",
  "dprint",
  "emmet",
  "gleam",
  "go",
  "elixir",
  "lua",
  "marksman",
  "pyright",
  "ruff",
  "rust",
  "tailwind",
  "ty",
  "typescript",
})

vim.diagnostic.config({
  signs = { priority = 9999 },
  underline = true,
  update_in_insert = false, -- false so diags are updated on InsertLeave
  virtual_text = {
    current_line = true,
    severity = { min = "INFO", max = "WARN" },
  },
  virtual_lines = { current_line = true, severity = { min = "ERROR" } },
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
  },
})
