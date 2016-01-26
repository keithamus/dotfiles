hs.console.clearConsole()
local hotkey = require "hs.hotkey"
local grid = require "hs.grid"
local window = require "hs.window"
local hyper = {"command", "option"}

grid.GRIDHEIGHT = 4
grid.GRIDWIDTH = 8
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

hotkey.bind(hyper, 'up', function()
  grid.show(function ()
    local focusedWindow = window:focusedWindow()
    for i, window in pairs(allWindowsInBounds(focusedWindow:frame())) do
      if window ~= focusedWindow then
        print(i, window)
      end
    end
  end)
end)

hotkey.bind(hyper, 'left', function()
  grid.adjustWindow(function(cell)
    cell.x = 0
    cell.y = 0
    cell.w = 4
    cell.h = 4
  end, window:focusedWindow())
end)

hotkey.bind(hyper, 'right', function()
  grid.adjustWindow(function(cell)
    cell.x = 4
    cell.y = 0
    cell.w = 4
    cell.h = 4
  end, window:focusedWindow())
end)

function allWindowsInBounds(rect)
  local windows = {}
  for i, window in pairs(window.allWindows()) do
    if (window:isStandard() and isRectInBounds(window:frame(), rect)) then
      table.insert(windows, window)
    end
  end
  return windows
end

function isRectInBounds(rect, bounds)
  if rect.x + rect.w < bounds.x then return false
  elseif rect.x > bounds.x + bounds.w then return false
  elseif rect.y + rect.h < bounds.y then return false
  elseif rect.y > bounds.y + bounds.h then return false
  else return true end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
hs.notify.new({title="Hammersppon", informativeText="Configuration reloaded!"}):send()
