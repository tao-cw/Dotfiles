# nvim-taocw

Minimal Neovim config, plugins managed by the built-in [vim.pack](https://neovim.io/doc/user/pack.html#vim.pack) (Nvim 0.12+).

## layout

```
init.lua              entry point: globals + module loading
lua/config/
  options.lua         vim options
  keymaps.lua         key mappings
  autocmds.lua        autocommands
  plugins.lua         vim.pack spec + plugin setup
  lsp.lua             LSP enablement
lsp/                  native vim.lsp.Config server configs (clangd, beancount)
ftplugin/             filetype-local settings (netrw)
nvim-pack-lock.json   plugin revisions lockfile (keep in git)
```

## plugins

- [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) — colorscheme (`transparent_mode` enabled)

Update plugins with `:lua vim.pack.update()`, review the confirmation buffer,
then `:write` to confirm (or `:quit` to discard).

## lsp

`:h lsp`
Server configs in `lsp/*.lua` are loaded natively (no lspconfig needed).
