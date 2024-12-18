return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = {
      alpha = true,
      blink_cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      neotest = true,
      overseer = true,
      semantic_tokens = true,
      snacks = true,
      treesitter = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return { WinSeparator = { fg = colors.overlay0 } }
    end,
  },
}
