local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local configs = require('lspconfig/configs')
root_pattern = util.root_pattern

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
  arduino_language_server = {
    cmd =  {
      "arduino-language-server",
      "-cli-config", ".arduino15/arduino-cli.yaml"
    }
  },
  cssls = {},
  denols = {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = root_pattern("deno.json", "deno.jsonc", "mod.ts", "deps.ts"),
  },
  dockerls = {},
  gopls = {},
  golangci_lint_ls = {},
  html = {},
  jsonls = {},
  rust_analyzer = {},
  solargraph = {},
  tsserver = {},
  sumneko_lua = {
    cmd = { "lua-language-server" },
  },
  vimls = {},
  yamlls = {}
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
