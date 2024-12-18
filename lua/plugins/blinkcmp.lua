return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "Kaiser-Yang/blink-cmp-avante",
    { "git@gitlab.alibaba-inc.com:damo.ydm/blink-cmp-lingma.git", build = "./install.sh" },
  },
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { ["<C-Enter>"] = { "show" } },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      trigger = { prefetch_on_insert = false },
    },
    cmdline = { enabled = false },
    signature = { enabled = true, window = { border = "single" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "avante", "lingma", "minuet" },
      providers = {
        avante = { name = "avante", module = "blink-cmp-avante" },
        lingma = { name = "lingma", module = "blink-cmp-lingma", score_offset = 100, async = true },
        minuet = { name = "minuet", module = "minuet.blink", score_offset = 8, async = true },
      },
    },
  },
}
