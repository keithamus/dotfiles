return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
