return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim" },
  --stylua: ignore
  keys = {
    { "<Leader>c", "", desc = "+Coverage" },
    { "<Leader>cl", function() require("coverage").load(true) end, desc = "Load Coverage" },
    { "<Leader>ct", function() require("coverage").toggle() end, desc = "Toggle Coverage" },
    { "<Leader>cs", function() require("coverage").summary() end, desc = "Coverage Summary" },
  },
  opts = { auto_reload = true },
}
