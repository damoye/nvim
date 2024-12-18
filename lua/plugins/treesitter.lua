return {
  "nvim-treesitter/nvim-treesitter",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  opts = {
    ensure_installed = { "bash", "go", "lua", "markdown_inline", "vim", "vimdoc" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  build = ":TSUpdate",
}
