return {
  { "Mofiqul/vscode.nvim" },
  { "catppuccin/nvim" },
  { "lifepillar/vim-solarized8", branch = "neovim" },
  { "navarasu/onedark.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "sainnhe/sonokai" },
  { "AstroNvim/astrotheme", opts = { background = { light = "astrolight", dark = "astrodark" } } },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
