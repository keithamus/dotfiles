return {
  -- add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup({
            method = "getCompletionsCycling",
            formatters = {
              insert_text = require("copilot_cmp.format").remove_existing,
            },
          })
        end,
        dependencies = {
          {
            "zbirenbaum/copilot.lua",
            config = true,
            opts = { panel = { enabled = false } },
          },
        },
      },
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "copilot", priority = 1001 },
        { name = "emoji", priority = 700 },
        { name = "calc", priority = 650 },
      }))
    end,
  },
}
