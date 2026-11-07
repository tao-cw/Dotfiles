-- Plugin management via vim.pack (built-in since Nvim 0.12). See :h vim.pack
--
-- Update plugins:  :lua vim.pack.update()   (review the confirm buffer, then :write)
-- Explore plugins: :lua vim.pack.update(nil, { offline = true })
-- Lockfile: nvim-pack-lock.json next to init.lua; keep it in git.

vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
})

require("gruvbox").setup({
  transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")
