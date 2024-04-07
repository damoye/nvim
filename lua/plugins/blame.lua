return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require("blame").setup({})
      vim.keymap.set("n", "<leader>gb", [[<Cmd>BlameToggle<CR>]], { desc = "Git Blame" })
    end,
    opts = {
      blame_options = { "-w" },
    },
  },
}
