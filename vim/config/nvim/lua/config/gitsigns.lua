require('gitsigns').setup {
  sign_priority = 5,
  signs = {
    add =          { hl = "GitGutterAdd", text = "" },
    change =       { hl = "GitGutterChange", text = "" },
    changedelete = { hl = "GitGutterChange", text = "" },
    delete =       { hl = "GitGutterDelete", text = "" },
    topdelete =    { hl = "GitGutterDelete", text = "" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol',
    delay = 250,
  }
}


vim.cmd [[highlight link GitSignsCurrentLineBlame LineNr]]
