return {

  {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function(_, opts)
          require("telescope").load_extension("dap")
        end
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          automatic_setup = true,
          ensure_installed = {
            "chrome-debug-adapter",
            "firefox-chrome-debug-adapter",
          },
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function(_, opts)
          local dapui = require("dapui")
          local dap = require("dap")
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end
      }
    },
    config = function(_, opts)
      require("dap")
      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })
    end,
    keys = {
      { "<leader>dh", function() return require("dap").toggle_breakpoint() end, mode = "n", desc = "Toggle Breakpoint" },
      {
        "<leader>dH",
        function() return require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, mode = "n",
        desc = "Set Conditional Breakpoint"
      },
      { "<S-k>", function() return require("dap").step_out() end, mode = "n", desc = "Step Out" },
      { "<S-l>", function() return require("dap").step_into() end, mode = "n", desc = "Step Into" },
      { "<S-j>", function() return require("dap").step_over() end, mode = "n", desc = "Step Over" },
      { "<S-h>", function() return require("dap").continue() end, mode = "n", desc = "Continue" },
      { "<leader>d_", function() return require("dap").run_last() end, mode = "n", desc = "Run Last" },
      { "<leader>dn", function() return require("dap").run_to_cursor() end, mode = "n", desc = "Run To Cursor" },
      {
        "<leader>de",
        function() return require("dap").set_exception_breakpoints() end, mode = "n",
        desc = "Break on Exceptions"
      },
      { "<leader>dr", function() return require("dap").repl_open({}, "vsplit") end, mode = "n", desc = "Open a REPL" },
    }
  },
}
