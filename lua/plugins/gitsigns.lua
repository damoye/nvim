return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
      },
      current_line_blame = true,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>gb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Git Blame Line Full" })
        map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })
        map("n", "<leader>gD", function()
          gitsigns.diffthis("~")
        end, { desc = "Git Diff~" })
      end,
    })
  end,
}
