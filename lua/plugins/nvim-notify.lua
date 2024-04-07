return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    vim.keymap.set("n", "<leader>un", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss All Notifications" })
  end,
}
