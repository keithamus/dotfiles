-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here


vim.cmd([[
  augroup TrailingWhitespace
    match TrailingWhitespace /\s\+$/
    autocmd BufReadPre * hi TrailingWhitespace guibg=red
    autocmd InsertEnter * hi TrailingWhitespace guibg=NONE
    autocmd InsertLeave * hi TrailingWhitespace guibg=red
  augroup END
]])
