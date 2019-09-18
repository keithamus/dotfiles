hs.window.animationDuration = 0.1
hs.console.clearConsole()
local logger = hs.logger.new("")
local hotkey = require "hs.hotkey"
local grid = require "hs.grid"
local window = require "hs.window"
local hyper = {"command", "option"}

grid.GRIDHEIGHT = 4
grid.GRIDWIDTH = 8
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

hotkey.bind(hyper, 'up', function()
  logger.d("here")
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

hotkey.bind(hyper, 'down', function()
  local resizing = hs.hotkey.modal.new()
  local activeWindow = hs.window.focusedWindow()
  local backdrop = hs.drawing.rectangle( hs.screen.mainScreen():frame() )
    :setFillColor({ red=0, green=0, blue=0, alpha=0.2 })
  local resizeIndicator = hs.drawing.rectangle({ x=0, y=0, w=0, h=0 })
    :setFillColor({ red=1, green=1, blue=1, alpha=0.3 })
    :setStrokeWidth(1)
    :setStroke(1)
    :setStrokeColor({ red=1, green=1, blue=1, alpha=0.5 })
  local startPosition = nil
  local movePosition = nil
  local followMouse = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDragged }, function()
    currentPosition = hs.mouse.getRelativePosition()
    if movePosition  then
      -- resizeIndicator.setTopLeft
      resizeIndicator
        :setTopLeft({
          x= (startPosition.x + currentPosition.x) - movePosition.x,
          y= (startPosition.y + currentPosition.y) - movePosition.y,
        })
    else
      resizeIndicator
        :setTopLeft({
          x= math.min(startPosition.x, currentPosition.x),
          y= math.min(startPosition.y, currentPosition.y),
        })
        :setSize({
          w= math.max(startPosition.x - currentPosition.x, currentPosition.x - startPosition.x),
          h= math.max(startPosition.y - currentPosition.y, currentPosition.y - startPosition.y),
        })
    end
  end)

  function resizing.entered()
    backdrop
      :bringToFront(true)
      :show()
    resizeIndicator
      :bringToFront(true)
  end

  function resizing:exited()
    followMouse:stop()
    backdrop:delete()
    resizeIndicator:delete()
    activeWindow:focus()
  end

  resizing:bind({}, 'escape', function() resizing:exit() end)
  resizing:bind({}, 'space',
    function() movePosition = hs.mouse.getRelativePosition() end,
    function()
      movePosition = nil
      startPosition = resizeIndicator:frame()
    end
  )

  backdrop:setClickCallback(function()
    pcall(function() activeWindow:setFrame( resizeIndicator:frame() ) end)
    resizing:exit()
  end, function()
    startPosition = hs.mouse.getRelativePosition()
    resizeIndicator
      :setTopLeft( startPosition )
      :setSize({ w=1, h=1 })
      :show()
    followMouse:start()
  end)

  resizing:enter()

end)
