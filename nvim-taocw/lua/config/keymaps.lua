local map = vim.keymap.set

map({ "i" }, "<c-space>", "<c-x><c-o>", { desc = "Trige completion" })

map({ "i" }, "jf", "<esc>", { desc = "Quit insert mode" })
map({ "n" }, "<leader>;", ":", { desc = "Enter cmdline mode" })
map({ "n" }, "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map({ "i", "x", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

map({ "n" }, "<leader>w", "<c-w>", { desc = "Map to <Ctrl-W>" })
map("n", "<c-h>", "<c-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<c-j>", "<c-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<c-k>", "<c-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<c-l>", "<c-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<s-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<s-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })

map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })


map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>e", "<cmd>e .<cr>")

map('t', '<Esc>', '<C-\\><C-n>')
