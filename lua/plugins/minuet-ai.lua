return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  opts = {
    provider = "openai_fim_compatible",
    request_timeout = 10,
    provider_options = {
      openai_fim_compatible = {
        model = "qwen-coder-turbo-latest",
        end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/completions",
        api_key = "DASHSCOPE_API_KEY",
        name = "Qianwen",
        stream = false,
        template = {
          prompt = function(context_before_cursor, context_after_cursor)
            return "<|fim_prefix|>"
              .. require("minuet.utils").add_language_comment()
              .. "\n"
              .. require("minuet.utils").add_tab_comment()
              .. "\n"
              .. context_before_cursor
              .. "<|fim_suffix|>"
              .. context_after_cursor
              .. "<|fim_middle|>"
          end,
          suffix = false,
        },
      },
    },
  },
}
