require('nvim-treesitter-textobjects')
require('nvim-treesitter.configs').setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['cna'] = '@parameter.inner',
      },
      swap_previous = {
        ['cpa'] = '@parameter.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']a'] = '@parameter.inner',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[a'] = '@parameter.inner',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    }
  }
}

print('loaded')
