return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  keys = { { "<Leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
