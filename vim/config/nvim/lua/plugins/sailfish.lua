return {
  {
    "rust-sailfish/sailfish",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/syntax/vim/")
    end
  }
}
