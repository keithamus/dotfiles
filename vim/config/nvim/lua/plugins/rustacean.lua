return {
  {
    "mrcjkb/rustaceanvim",
    enabled = true,
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = false,
          },
        },
      },
    },
  },
}
