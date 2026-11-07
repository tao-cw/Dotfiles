-- Native LSP: server configs live in lsp/*.lua (see :h lsp-config, :h vim.lsp.Config)

vim.lsp.log.set_level(5)
vim.lsp.enable({ "clangd", "beancount" })

vim.filetype.add({
  extension = {
    beancount = "beancount",
    bean = "beancount",
  },
})
