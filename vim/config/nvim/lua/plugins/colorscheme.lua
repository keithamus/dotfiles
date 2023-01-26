return {
  -- theme

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    tag = "v0.0.7",
    priority = 1000,
    opts = {
      dark_float = true,
      overrides = function()
        return {
          BufferLineBackground = {},
        }
      end,
    },
    config = function(_, opts)
      local function getWALMode()
        local home = os.getenv("HOME")
        local colors = io.open(home .. "/.cache/wal/colors", "r")
        if not colors then
          return "light"
        end
        io.input(colors)
        local background = io.read()
        io.close(colors)
        local color = tonumber(string.sub(background, 2), 16)
        if color < 8000000 then
          return "dark"
        end
        return "light"
      end

      vim.opt.background = getWALMode()
      opts.theme_style = vim.o.background
      require("github-theme").setup(opts)

      vim.cmd([[highlight link NonText LineNr]])
      vim.cmd([[highlight link Whitespace LineNr]])
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light",
    },
  },
}
