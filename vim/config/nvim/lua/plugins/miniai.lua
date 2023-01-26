return {
  "echasnovski/mini.ai",
  opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        p = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }, {}),
        l = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }, {}),
        b = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }, {}),
      },
    }
  end,
}
