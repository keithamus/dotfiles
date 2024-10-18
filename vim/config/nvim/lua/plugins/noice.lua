return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "yanked",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "more lines",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "fewer lines",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "<ed",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = ">ed",
          },
          opts = { skip = true }
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "No information",
          },
          opts = { skip = true }
        },
      }
    end,
  }
}
