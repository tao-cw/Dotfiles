---@brief
---
--- https://github.com/polarmutex/beancount-language-server#installation
---
--- See https://github.com/polarmutex/beancount-language-server#configuration for configuration options

---@type vim.lsp.Config
return {
  cmd = { 'beancount-language-server', '--stdio' },
  filetypes = { 'beancount' },
  root_markers = { 'main.bean', '.git' },
  init_options = {
    journal_file = "main.bean"
  },
}
