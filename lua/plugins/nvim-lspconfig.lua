return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = { gofumpt = true },
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = { Lua = { completion = { callSnippet = "Replace" } } },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end
        map("<leader>R", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("K", vim.lsp.buf.hover, "Hover Information")
        map("gs", vim.lsp.buf.signature_help, "Signature Help")

        -- map("gd", vim.lsp.buf.definition, "Go to Definitions")
        -- map("gi", vim.lsp.buf.implementation, "Go to Implementations")
        -- map("gr", vim.lsp.buf.references, "Go to References")
      end,
    })
  end,
}
