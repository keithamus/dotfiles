-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- disable "Ex mode"
-- vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true })

vim.cmd([[highlight! link SignColumn LineNr]])
vim.diagnostic.config({
  virtual_text = false,
})
