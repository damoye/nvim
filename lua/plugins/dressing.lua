return {
  "stevearc/dressing.nvim",
  lazy = true,
  init = function()
    for _, func in ipairs({ "select", "input" }) do
      local old_func = vim.ui[func]
      vim.ui[func] = function(...)
        vim.ui[func] = old_func
        require("lazy").load({ plugins = { "dressing.nvim" } })
        vim.ui[func](...)
      end
    end
  end,
}
