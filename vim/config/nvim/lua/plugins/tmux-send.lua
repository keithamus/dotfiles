return {
  "kiyoon/tmux-send.nvim",
  keys = {
    {
      "-",
      function()
        require("tmux_send").send_to_pane()
        -- (Optional) exit visual mode after sending
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      end,
      mode = { "n", "x" },
      desc = "Send to tmux pane",
    },
    {
      "_",
      function()
        require("tmux_send").send_to_pane({ add_newline = false })
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      end,
      mode = { "n", "x" },
      desc = "Send to tmux pane (plain)",
    },
    {
      "<space>-",
      function()
        require("tmux_send").send_to_pane({ count_is_uid = true })
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      end,
      mode = { "n", "x" },
      desc = "Send to tmux pane w/ pane uid",
    },
    {
      "<space>_",
      function()
        require("tmux_send").send_to_pane({ count_is_uid = true, add_newline = false })
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      end,
      mode = { "n", "x" },
      desc = "Send to tmux pane w/ pane uid (plain)",
    },
    {
      "<C-_>",
      function()
        require("tmux_send").save_to_tmux_buffer()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      end,
      mode = { "n", "x" },
      desc = "Save to tmux buffer",
    },
  },
}
