local Menu = {}

local Button = nil
local playButton = nil
local exitButton = nil

function Menu.onEnter()
  Globals.mouseVisible = true
  love.mouse.setVisible(Globals.mouseVisible)
  love.mouse.setGrabbed(false)
  
  Menu.Title = {
      text = "Brick Breaker",
      x = Globals.Screen.x,
      y = 50
  }
  
  Button = require("src/objs/button")
  playButton = Button.new("Play", Globals.Screen.width / 2, Globals.Screen.height / 2, function()
      GameState:changeState("levelTransition")
    end)
  
  exitButton = Button.new("Exit", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 100, function()
      love.event.quit()
    end)
end


function Menu.update(dt)
  playButton:update(dt)
  exitButton:update(dt)
end


function Menu.mousepressed(x, y, button)
  if playButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function Menu.draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Globals.Graphics.Fonts.TitleFont)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  Menu.Title = {}
  Button = nil
  playButton = nil
  exitButton = nil
end

return Menu
