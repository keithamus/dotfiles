return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "regex",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    },
  }
}
