return {
  "Exafunction/codeium.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-lualine/lualine.nvim",
  },
  cmd = "Codeium",
  event = "InsertEnter",
  config = function()
    require("codeium").setup({
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept_word = "<C-k>",
          clear = "<C-]>",
        },
      },
    })
    local virtual_text = require("codeium.virtual_text")
    virtual_text.set_statusbar_refresh(require("lualine").refresh)
    vim.keymap.set("i", "<M-Bslash>", virtual_text.complete, { desc = "Codeium Complete" })
    require("lualine").setup({
      sections = {
        lualine_x = {
          function()
            return string.format("[%s]", require("codeium.virtual_text").status_string())
          end,
          "filetype",
        },
      },
    })
  end,
}
