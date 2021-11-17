function getWALMode ()
  local home = os.getenv("HOME")
  local colors = io.open(home .. "/.cache/wal/colors", "r")
  if not colors then return "light" end
  io.input(colors)
  local background = io.read()
  io.close(colors)
  local color = tonumber(string.sub(background, 2), 16)
  if (color < 8000000) then return "dark" end
  return "light"
end

vim.o.background = getWALMode()
require('github-theme').setup({
  theme_style = vim.o.background,
})

vim.cmd [[highlight link NonText LineNr]]
vim.cmd [[highlight link Whitespace LineNr]]
