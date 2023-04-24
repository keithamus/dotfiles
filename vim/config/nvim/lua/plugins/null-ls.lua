return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local builtins = require("null-ls").builtins
      return {
        sources = {
          builtins.diagnostics.editorconfig_checker.with({
            condition = function()
              return vim.fn.executable("ec") > 0
            end,
          }),
          builtins.diagnostics.eslint.with({
            condition = function()
              return vim.fn.executable("eslint") > 0
            end,
          }),
          builtins.diagnostics.flake8.with({
            condition = function()
              return vim.fn.executable("flake8") > 0
            end,
          }),
          builtins.diagnostics.gitlint.with({
            condition = function()
              return vim.fn.executable("gitlint") > 0
            end,
          }),
          builtins.diagnostics.jsonlint.with({
            condition = function()
              return vim.fn.executable("jsonlint") > 0
            end,
          }),
          builtins.diagnostics.luacheck.with({
            condition = function()
              return vim.fn.executable("luacheck") > 0
            end,
          }),
          builtins.diagnostics.markdownlint.with({
            condition = function()
              return vim.fn.executable("markdownlint") > 0
            end,
          }),
          builtins.diagnostics.protoc_gen_lint.with({
            condition = function()
              return vim.fn.executable("protoc") > 0
            end,
          }),
          builtins.diagnostics.rubocop.with({
            condition = function()
              return vim.fn.executable("rubocop") > 0
            end,
          }),
          builtins.diagnostics.shellcheck.with({
            condition = function()
              return vim.fn.executable("shellcheck") > 0
            end,
          }),
          builtins.diagnostics.stylelint.with({
            condition = function()
              return vim.fn.executable("stylelint") > 0
            end,
          }),
          builtins.diagnostics.yamllint.with({
            condition = function()
              return vim.fn.executable("yamllint") > 0
            end,
          }),

          builtins.formatting.autopep8.with({
            condition = function()
              return vim.fn.executable("autopep8") > 0
            end,
          }),
          builtins.formatting.deno_fmt.with({
            condition = function()
              return vim.fn.executable("deno") > 0
            end,
          }),
          builtins.formatting.gofmt.with({
            condition = function()
              return vim.fn.executable("go") > 0
            end,
          }),
          builtins.formatting.fish_indent.with({
            condition = function()
              return vim.fn.executable("fish_indent") > 0
            end,
          }),
          builtins.formatting.json_tool.with({
            condition = function()
              return vim.fn.executable("python") > 0
            end,
          }),
          builtins.formatting.markdownlint.with({
            condition = function()
              return vim.fn.executable("markdownlint") > 0
            end,
          }),
          builtins.formatting.prettier.with({
            condition = function()
              return vim.fn.executable("prettier") > 0
            end,
          }),
          builtins.formatting.protolint.with({
            condition = function()
              return vim.fn.executable("protolint") > 0
            end,
          }),
          builtins.formatting.rubocop.with({
            condition = function()
              return vim.fn.executable("rubocop") > 0
            end,
          }),
          builtins.formatting.stylelint.with({
            condition = function()
              return vim.fn.executable("stylelint") > 0
            end,
          }),
        },
      }
    end,
  },
}
