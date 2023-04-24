-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- show hidden characters
opt.hidden = true
opt.list = true
opt.listchars = {
  tab = "▸ ",
  eol = " ",
  space = "·",
}

-- make tabs 2 spaces, but use softtabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- disable annoying folding and concealing
opt.conceallevel = 0
opt.foldenable = false

-- enable backups
opt.backup = true
opt.writebackup = true
opt.updatetime = 300
opt.backupdir = "~/.cache/nvim/backups//,."

-- Always show the tab line
opt.showtabline = 2

-- Minimal statusbar info
opt.shortmess = "aoOtTFc"

-- Delay popups a little longer
opt.updatetime = 500

-- disable relative lines
opt.relativenumber = false
