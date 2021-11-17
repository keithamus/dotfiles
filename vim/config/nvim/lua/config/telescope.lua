local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.load_extension('fzy_native')
telescope.setup{
  defaults = {
    file_ignore_patterns = {'__pycache__', 'node_modules'},
    mappings = {
      i = {
        ['<ESC>'] = actions.close
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}

local M = {}
M.project_files = function(opts)
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("config.telescope").project_files()<CR>', { noremap=true, silent=True })
vim.api.nvim_set_keymap('n', '<C-o>', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap=true, silent=True })
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap=true, silent=True })

return M
