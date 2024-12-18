vim.g.screenkey_statusline_component = true
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    { "NStefan002/screenkey.nvim", opts = { win_opts = { width = 20 } } },
  },
  event = "VeryLazy",
  opts = {
    extensions = { "lazy", "mason", "nvim-dap-ui", "overseer", "quickfix" },
    sections = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        "filename",
      },
      lualine_x = {
        function()
          return require("screenkey").get_keys()
        end,
        "overseer",
      },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
