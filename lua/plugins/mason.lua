return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({ ensure_installed = { "gopls", "goimports", "lua_ls", "stylua" } })
  end,
}
