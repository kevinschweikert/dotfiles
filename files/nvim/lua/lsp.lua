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
  "typst",
})

vim.diagnostic.config({
  signs = {
    priority = 9999,
    text = {
      [vim.diagnostic.severity.ERROR] = "✗",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.INFO] = "ℹ",
      [vim.diagnostic.severity.HINT] = "💡",
    },
  },
  underline = true,
  update_in_insert = false, -- false so diags are updated on InsertLeave
  virtual_text = {
    current_line = true,
    prefix = "●",
    severity = { min = vim.diagnostic.severity.INFO, max = vim.diagnostic.severity.ERROR },
  },
  -- virtual_lines = { current_line = true, severity = { min = vim.diagnostic.severity.ERROR } },
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
  },
})

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.notify("No LSP clients attached to current buffer")
  else
    for _, client in ipairs(clients) do
      vim.notify("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = "Show LSP client info" })
