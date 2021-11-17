local cmp = require('cmp')
cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' }
  },

  formatting = {
    deprecated = true,
    format = function(entry, vim_item)
      -- icons
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
      })[entry.source.name]
      return vim_item
    end
  }

})
