return {
  "yetone/avante.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  version = "*",
  ---@type avante.Config
  opts = {
    provider = "qianwen",
    auto_suggestions_provider = "qianwen",
    vendors = {
      qianwen = {
        __inherited_from = "openai",
        api_key_name = "DASHSCOPE_API_KEY",
        endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
        model = "qwen-coder-plus-latest",
        -- model = "qwen-coder-turbo-latest",
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-coder",
      },
    },
    file_selector = { provider = "snacks" },
    behaviour = { enable_cursor_planning_mode = true },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "Avante" } },
      ft = { "Avante" },
    },
  },
}
