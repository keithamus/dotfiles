local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

-- override handlers
-- pcall(require, "modules.lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local servers = {
  denols = {
    filetypes = { "typescript", "typescriptreact" },
  },
  tsserver = {
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
  sumneko_lua = {
    cmd = { "lua-language-server" },
  },
  -- jsonls = require("modules.lsp.json").config,
  html = {
    cmd = { "vscode-html-language-server", "--stdio" }
  },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" }
  },
  gopls = {
    settings = {
      gopls = {
        codelenses = {
          references = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          generate = true,
        },
        gofumpt = true,
      },
    },
  },
}

for name, opts in pairs(servers) do
  if type(opts) == "function" then
    opts()
  else
    local client = lspconfig[name]
    client.setup {
      flags = { debounce_text_changes = 150 },
      cmd = opts.cmd or client.cmd,
      filetypes = opts.filetypes or client.filetypes,
      on_attach = opts.on_attach or client.lsp_on_attach,
      on_init = opts.on_init or client.on_init,
      handlers = opts.handlers or client.handlers,
      root_dir = opts.root_dir or client.root_dir,
      capabilities = opts.capabilities or capabilities,
      settings = opts.settings or {},
    }
  end
end
