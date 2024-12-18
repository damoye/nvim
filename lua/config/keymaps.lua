vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Left" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Up" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Right" })
vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })
vim.keymap.set("n", "<Leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Information" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

vim.keymap.set("n", "<Leader>q", function()
  if vim.fn.getqflist({ winid = 0 }).winid == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end, { desc = "Toggle Quickfix" })

vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "Code Action" })
