return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({ textobjects = false })
    vim.keymap.set("n", "<Leader>c", "<cmd>silent! wa | GoCoverage -p<CR>", { desc = "Go Coverage" })
    vim.keymap.set("n", "<Leader>l", "<cmd>silent! wa | GoLint<CR>", { desc = "Go Lint" })
    vim.keymap.set("n", "<Leader>r", "<cmd>silent! wa | GoRun % -F<CR>", { desc = "Go Run" })
    vim.keymap.set("n", "<Leader>t", "<cmd>silent! wa | GoTestFile<CR>", { desc = "Go Test" })
    vim.keymap.set("n", "<Leader>b", "<cmd>silent! wa | GoBuild %:p:h<CR>", { desc = "Go Build" })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
