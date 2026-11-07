vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Host providers (must be set before any plugin loads)
vim.g.python3_host_prog = "$HOME/workspace/venv/base/bin/python"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.plugins")
require("config.lsp")
