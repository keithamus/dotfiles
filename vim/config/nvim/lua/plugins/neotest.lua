return {
  { "nvim-neotest/neotest-plenary" },
  { "rouge8/neotest-rust" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-rust"
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    }
  }
}
