return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = { lua = { "stylua" } },
    format_on_save = function()
      if vim.g.autoformat then
        return { timeout_ms = 5000, lsp_format = "fallback" }
      end
    end,
  },
}
