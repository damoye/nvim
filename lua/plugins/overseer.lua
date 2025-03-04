return {
  "stevearc/overseer.nvim",
  keys = {
    { "<Leader>ow", "<Cmd>OverseerToggle<CR>", desc = "Overseer Toggle" },
    { "<Leader>oo", "<Cmd>OverseerRun<CR>", desc = "Overseer Run" },
    { "<Leader>oq", "<Cmd>OverseerQuickAction<CR>", desc = "Overseer Quick Action" },
    { "<Leader>ot", "<Cmd>OverseerTaskAction<CR>", desc = "Overseer Task action" },
    { "<Leader>oi", "<Cmd>OverseerInfo<CR>", desc = "Overseer Info" },
    { "<Leader>ob", "<Cmd>OverseerRun gobuild<CR>", desc = "Go Build" },
    { "<Leader>or", "<Cmd>OverseerRun run<CR>", desc = "Run" },
  },
  opts = {
    templates = { "user.gobuild", "user.run", "builtin" },
    task_list = {
      bindings = {
        ["<C-q>"] = false,
        ["<C-h>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        K = "IncreaseDetail",
        J = "DecreaseDetail",
        ["<C-p>"] = "ScrollOutputUp",
        ["<C-n>"] = "ScrollOutputDown",
      },
    },
  },
}
