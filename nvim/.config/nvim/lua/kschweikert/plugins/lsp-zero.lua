local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.configure('html', {
  filetypes = { "html", "heex" }
})
lsp.setup()
