require'nvim-treesitter.configs'.setup {
  -- one of "all", (parsers with maintainers), or a list of languages
  ensure_installed = "all",
  -- List of parsers to ignore installing
  ignore_install = { "phpdoc" }, 
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
