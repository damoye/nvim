return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "leoluz/nvim-dap-go", opts = {} },
    { "rcarriga/nvim-dap-ui", opts = {} },
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  -- stylua: ignore
  keys = {
    { "<Leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<Leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<Leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<Leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<Leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<Leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<Leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    { "<Leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<Leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<Leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<Leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    { "<Leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      ui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      ui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      ui.close({})
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    sign(
      "DapStopped",
      { text = "󰁕", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
    )
  end,
}
