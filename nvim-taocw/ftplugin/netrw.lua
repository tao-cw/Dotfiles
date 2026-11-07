vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local bufmap = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { buffer = true, remap = true })
    end
    bufmap("l", "<cr>")
    bufmap("h", "-")
  end,
})
