return {
  "nvim-neo-tree/neo-tree.nvim",
  -- branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<Leader>e", "<cmd>Neotree toggle<CR>", desc = "File Explorer Toggle" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = { follow_current_file = { enabled = true } },
      buffers = { follow_current_file = { enable = true } },
      -- source_selector = { winbar = true },
    })
  end,
}
