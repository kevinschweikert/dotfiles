vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  -- Define your formatters
  formatters_by_ft = {
    lua = { "stylua" },
    fish = { "fish_indent" },
    toml = { "pyproject-fmt" },
    yaml = { "yamlfmt" },
  },
  -- Set default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  -- Set up format-on-save
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    yamlfmt = {
      prepend_args = {
        "-formatter",
        "retain_line_breaks_single=true",
        "drop_merge_tag=true",
      },
    },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
