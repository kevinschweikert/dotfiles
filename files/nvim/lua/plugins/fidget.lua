vim.pack.add({ "http://github.com/j-hui/fidget.nvim" })
require("fidget").setup({
  notification = {
    override_vim_notify = true,
  },
})
