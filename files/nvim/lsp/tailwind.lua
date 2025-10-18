return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_markers = { "package.json", ".git" },
  -- filetypes copied and adjusted from tailwindcss-intellisense
  filetypes = {
    -- html
    "django-html",
    "htmldjango",
    "eelixir", -- vim ft
    "elixir",
    "gohtml",
    "gohtmltmpl",
    "handlebars",
    "hbs",
    "html",
    "html-eex",
    "heex",
    "markdown",
    "mdx",
    -- css
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    -- js
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    -- mixed
    "vue",
    "svelte",
  },
  settings = {
    tailwindCSS = {
      classAttributes = {
        "class",
        "className",
        "class:list",
        "classList",
        "ngClass",
      },
      includeLanguages = {
        eelixir = "html-eex",
        elixir = "html-eex",
        heex = "html-eex",
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}
