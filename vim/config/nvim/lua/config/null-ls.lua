local nullls = require('null-ls')
local builtins = nullls.builtins
nullls.config {
  sources = {
    builtins.diagnostics.eslint.with({
      condition = function()
        return vim.fn.executable("eslint") > 0
      end,
    }),
    builtins.formatting.stylua.with({
      condition = function()
        return vim.fn.executable("eslint") > 0
      end,
    })
  }
}
require("lspconfig")["null-ls"].setup {}

