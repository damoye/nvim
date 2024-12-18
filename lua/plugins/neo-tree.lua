return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = { { "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" } },
  opts = {
    filesystem = { follow_current_file = { enabled = true } },
    buffers = { follow_current_file = { enable = true } },
  },
}
