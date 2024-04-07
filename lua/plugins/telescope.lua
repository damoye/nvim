return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({ extensions = { fzf = {} } })
    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Helps" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Current Word" })

    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to Definitions" })
    vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to Implementations" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to References" })
    vim.keymap.set("n", "gR", function()
      builtin.lsp_references({ file_ignore_patterns = { "%_test.go" } })
    end, { desc = "Go to References Ignoring Tests" })
  end,
}
