-- disable "Ex mode"
vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true })

--
vim.opt.hidden = true

-- show hidden characters
vim.opt.list = true

-- show _these_ hidden characters
vim.opt.listchars = {
  tab = "▸ ",
  eol = " ",
  space = "·"
}

-- search case insensitive by default
vim.o.ignorecase = true

-- enable mouse support
vim.o.mouse = "a"

-- enable line numbers
vim.o.number = true

-- disable line wrapping
vim.o.wrap = false

-- make tabs 2 spaces, but use softtabs
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- attempt to make things true-color
vim.o.termguicolors = true

-- attempt to speed up redrawing
vim.o.lazyredraw = true
vim.o.ttyfast = true

-- disable annoying folding and concealing
vim.o.cole = 0
vim.o.foldenable = false
-- let g:vim_markdown_folding_disabled = 1
-- let g:vim_markdown_conceal = 0

-- disable backups
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
--
-- enable inccommand
vim.o.inccommand = "nosplit"

-- disable vim's default mode line (e.g. `--INSERT--`)
vim.o.showmode = false

-- Always show the tab line
vim.o.showtabline = 2

-- Minimal statusbar info
vim.o.laststatus = 0
vim.o.shortmess = "aoOtTFc"

vim.o.signcolumn = "yes"
vim.cmd [[highlight! link SignColumn LineNr]]
