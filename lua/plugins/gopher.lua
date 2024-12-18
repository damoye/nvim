return {
  "olexsmir/gopher.nvim",
  ft = { "go" },
  -- branch = "develop",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  opts = {},
}
