local cover_file = os.tmpname()
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "fredrikaverpil/neotest-golang",
    },
  --stylua: ignore
  keys = {
    { "<Leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
    { "<Leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Test All" },
    { "<Leader>tr", function() require("neotest").run.run() end, desc = "Test Nearest" },
    { "<Leader>tl", function() require("neotest").run.run_last() end, desc = "Test Last" },
    { "<Leader>ts", function() require("neotest").summary.toggle() end, desc = "Test Summary" },
    { "<Leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Test Output" },
    { "<Leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Test Output Panel" },
    { "<Leader>tS", function() require("neotest").run.stop() end, desc = "Stop Test" },
    { "<Leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest Test" },
  },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            runner = "gotestsum",
            go_test_args = { "-coverprofile=" .. cover_file },
          }),
        },
        consumers = {
          ---@diagnostic disable-next-line: assign-type-mismatch
          overseer = require("neotest.consumers.overseer"),
        },
      })
    end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<Leader>tc",
        function()
          local coverage = require("coverage")
          local signs = require("coverage.signs")
          if signs.is_enabled() then
            coverage.clear()
          else
            coverage.load(true)
          end
        end,
        desc = "Test Toggle Coverage",
      },
    },
    opts = {
      auto_reload = true,
      lang = { go = { coverage_file = cover_file } },
    },
  },
}
