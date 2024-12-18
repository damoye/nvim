-- vim.g.screenkey_statusline_component = true
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  event = "VeryLazy",
  opts = {
    extensions = { "lazy", "mason", "nvim-dap-ui", "overseer", "quickfix" },
    sections = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        "filename",
      },
      lualine_x = { "overseer" },
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
