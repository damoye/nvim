local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end
return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = {
      win = {
        keys = {
          nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
          nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
          nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
          nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<Leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<Leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
    { "<c-/>", function() Snacks.terminal() end, mode = {"n", "t"}, desc = "Terminal" },
    { "<Leader>e", function() Snacks.explorer.open() end, desc = "File Explorer" },
    { "grr", function() Snacks.picker.lsp_references() end, desc = "References"},
    { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Implementations"},
    {
      "gR",
      function()
        Snacks.picker.lsp_references({
          filter = {
            filter = function(item)
              local suffix = "_test.go"
              return item.file:sub(-#suffix) ~= suffix
            end,
          },
        })
      end,
      desc = "References exclude Tests",
    },
    { "<Leader>ff", function() Snacks.picker.files({ root = false }) end, desc = "Files" },
    { "<Leader>fr", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent" },
    ---@diagnostic disable-next-line: assign-type-mismatch
    { "<Leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Files" },
    { "<Leader>fg", function() Snacks.picker.grep({ root = false }) end, desc = "Grep" },
    { "<Leader>fw", function() Snacks.picker.grep_word({ root = false }) end, desc = "Find Selection or Word", mode = { "n", "x" } },
    { "<Leader>fh", function() Snacks.picker.help() end, desc = "Helps" },
    { "<Leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<Leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<Leader>n", function() Snacks.picker.notifications() end, desc = "Notifications" },
    { "<Leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<Leader>uc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local Snacks = require("snacks")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<Leader>uw")
        Snacks.toggle.indent():map("<Leader>ug")
        Snacks.toggle({
          name = "Auto Format",
          get = function()
            return vim.g.autoformat
          end,
          set = function(state)
            vim.g.autoformat = state
          end,
        }):map("<Leader>uf")
      end,
    })
  end,
}
